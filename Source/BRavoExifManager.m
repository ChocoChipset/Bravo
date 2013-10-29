//
//  BRavoExifManager.m
//  Bravo
//
//  Created by Hector Zarate on 10/29/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import "BRavoExifManager.h"
#import <ImageIO/ImageIO.h>


@implementation BRavoExifManager

- (NSDictionary *)exifPropertiesOfJPEGData:(NSData *)paramJPEGData
{
    if (paramJPEGData.length == 0)
    {
        return nil;
    }
    
    NSDictionary *result = nil;
    
    CGImageSourceRef imageSourceRef = CGImageSourceCreateWithData((__bridge CFDataRef)paramJPEGData,
                                                                   NULL);
    
    if (imageSourceRef)
    {
        CFDictionaryRef metadataReference = CGImageSourceCopyPropertiesAtIndex(imageSourceRef,
                                                                               0,
                                                                               NULL);
        
        CFRelease(imageSourceRef);
        
        if (metadataReference)
        {
            result = [NSDictionary dictionaryWithDictionary:(__bridge NSDictionary *)metadataReference];
            
            CFRelease(metadataReference);
        }
        
    }
    
    return result;
}

@end
