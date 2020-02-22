//
//  BitcoinJS.swift
//  Blockstack
//
//  Created by Yukan Liao on 2018-04-18.
//

import Foundation
import JavaScriptCore

open class BitcoinJS {
    
    lazy var context: JSContext? = {
        let context = JSContext()
        
        let frameworkBundle = Bundle(for: type(of: self))
        let bundleURL = frameworkBundle.resourceURL?.appendingPathComponent("Blockstack.bundle")
        let resourceBundle = Bundle(url: bundleURL!)
        
        // bitcoinjs
        guard let
            JSPath = resourceBundle?.path(forResource: "bitcoinjs", ofType: "js") else {
                print("Unable to read resource files.")
                return nil
        }
        
        do {
            let bitcoinJS = try String(contentsOfFile: JSPath, encoding: String.Encoding.utf8)
            _ = context?.evaluateScript(bitcoinJS)
            
        } catch (let error) {
            print("Error while processing script file: \(error)")
        }
        
        // bigi
        guard let
            bigiJSPath = resourceBundle?.path(forResource: "bigi", ofType: "js") else {
                print("Unable to read resource files.")
                return nil
        }
        
        do {
            let bigiJS = try String(contentsOfFile: bigiJSPath, encoding: String.Encoding.utf8)
            _ = context?.evaluateScript(bigiJS)
            
        } catch (let error) {
            print("Error while processing script file: \(error)")
        }
        
        
        context?.exceptionHandler = {(context: JSContext?, exception: JSValue?) -> Void in
            print(exception!.toString())
        }
        
        _ = context?.evaluateScript("var console = { log: function(message) { _consoleLog(message) } }")
        
        let consoleLog: @convention(block) (String) -> Void = { message in
            print("console.log: " + message)
        }
        
        context?.setObject(unsafeBitCast(consoleLog, to: AnyObject.self),
                           forKeyedSubscript: "_consoleLog" as NSCopying & NSObjectProtocol)
        
        return context
    }()
    
    public func signChallenge(privateKey: String, challengeText: String) -> String? {
        guard let context = context else {
            print("JSContext not found.")
            return nil
        }
        
        _ = context.evaluateScript("var d = bigi.fromHex('\(privateKey)')")
        _ = context.evaluateScript("var challengeSigner = new bitcoinjs.ECPair(d)")
        _ = context.evaluateScript("var digest = bitcoinjs.crypto.sha256('\(challengeText)')")
        let signature = context.evaluateScript("challengeSigner.sign(digest).toDER().toString('hex')")
        return signature?.toString()
    }

    public func fromBase58Check(address: String) -> (version: String, hash: String)? {
        guard let context = self.context else {
            return nil
        }
        let value = context.evaluateScript("bitcoinjs.address.fromBase58Check('\(address)')")
        // TODO: Cast properly
        return value as? (String, String)
    }
    
    public func toBase58Check(hash: String, version: String) -> String? {
        guard let context = self.context else {
            return nil
        }
        let value = context.evaluateScript("bitcoinjs.address.toBase58Check('\(hash)', '\(version)')")
        return value?.toString()
    }
    
    public func coerceAddress(address: String) -> String? {
        guard let context = self.context else {
            return nil
        }
        context.evaluateScript("""
            function coerceAddress(address) {
                const layer1 = bitcoinjs.networks.bitcoin;
                const { hash, version } = bitcoinjs.address.fromBase58Check(address);
                const scriptHashes = [bitcoinjs.networks.bitcoin.scriptHash,
                    bitcoinjs.networks.testnet.scriptHash];
                const pubKeyHashes = [bitcoinjs.networks.bitcoin.pubKeyHash,
                    bitcoinjs.networks.testnet.pubKeyHash];
                let coercedVersion;
                if (scriptHashes.indexOf(version) >= 0) {
                    coercedVersion = layer1.scriptHash;
                } else if (pubKeyHashes.indexOf(version) >= 0) {
                    coercedVersion = layer1.pubKeyHash;
                } else {
                    throw new Error(`Unrecognized address version number ${version} in ${address}`);
                }
                return bitcoinjs.address.toBase58Check(hash, coercedVersion);
            }
        """)
        return context.evaluateScript("coerceAddress('\(address)')")?.toString()
    }
}
