#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "PDFImage.h"
#import "PIPDFDocument.h"
#import "PIPDFPage.h"
#import "UIImage+PDFImage.h"

FOUNDATION_EXPORT double PDFImageVersionNumber;
FOUNDATION_EXPORT const unsigned char PDFImageVersionString[];

