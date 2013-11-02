//
//  BRavoExifManager.m
//  Bravo
//
//  Created by Hector Zarate on 10/29/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import "BRavoExifManager.h"
#import <ImageIO/ImageIO.h>


@implementation NSDictionary (Utilities)

- (NSDictionary *)flattenDictionaryObjects
{
    NSMutableDictionary *oneLevelDictionary = [NSMutableDictionary dictionary];
    
    for (id key in [self allKeys])
    {
        id objectForKey = self[key];
        
        if ([objectForKey isKindOfClass:[NSDictionary class]])
        {
            [oneLevelDictionary addEntriesFromDictionary:objectForKey];
        }
        else
        {
            [oneLevelDictionary setObject:objectForKey
                                   forKey:key];
        }
    }
    
    return oneLevelDictionary;
}

@end


static BRavoExifManager *static_exifManager = nil;

@implementation BRavoExifManager

+ (instancetype)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        static_exifManager = [[BRavoExifManager alloc] init];
    });
    
    return static_exifManager;
}

- (NSDictionary *)extractMetadataFromJPEG:(NSData *)paramJPEGData
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
            NSDictionary *jpegMetadata = [NSDictionary dictionaryWithDictionary:(__bridge NSDictionary *)metadataReference];
            
            CFRelease(metadataReference);
            
            result = [jpegMetadata flattenDictionaryObjects];
        }
        
    }
    
    return result;
}

@end



