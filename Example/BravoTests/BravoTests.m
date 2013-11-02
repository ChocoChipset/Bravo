//
//  BravoTests.m
//  BravoTests
//
//  Created by Hector Zarate on 10/29/13.
//  Copyright (c) 2013 Hector Zarate. All rights reserved.
//

#import "BRavoExifManager.h"
#import <XCTest/XCTest.h>

@interface BravoTests : XCTestCase

@end

@implementation BravoTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExtractMetadataFromJPG
{
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *imagePath = [bundle pathForResource:@"DeathThrow" ofType:@"jpg"];
    
    NSUInteger numberOfExpectedMetadataProperties = 58;
    
    
    NSData *imageData = [NSData dataWithContentsOfFile:imagePath];
    
    NSDictionary *exifProperties = [[BRavoExifManager sharedManager] extractMetadataFromJPEG:imageData];
    
    XCTAssertEqual(exifProperties.count,
                   numberOfExpectedMetadataProperties,
                   @"The number of metadata properties extracted is different from the expected result");
}

@end
