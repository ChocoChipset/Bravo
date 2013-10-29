//
//  BRavoExifManager.h
//  Bravo
//
//  Created by Hector Zarate on 10/29/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BRavoExifManager : NSObject

- (NSDictionary *)exifPropertiesOfJPEGData:(NSData *)paramData;

@end
