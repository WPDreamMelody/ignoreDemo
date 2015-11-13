//
//  NVTableViewPerformanceTests.m
//  NVTableViewPerformanceTests
//
//  Created by Yuki on 15/11/12.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "NVTableViewCell.h"

static NSString *curidentifier = @"performNVTableViewCellID";

@interface NVTableViewPerformanceTests : XCTestCase
@property (strong,nonatomic) UITableView *myTableView;
@end

@implementation NVTableViewPerformanceTests

- (void)setUp {
    [super setUp];
    
    self.myTableView  =  [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 640)];
    [self.myTableView registerClass:[NVTableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    [self measureBlock:^{
        [self compare];
    }];
}

- (void)compare{
    NSInteger Size = 1000;
    double starTime = [[NSDate date]timeIntervalSince1970];
    for (NSInteger row=0; row<Size;row ++) {
        [self performNVTableViewCell:row];
    }
    double midTime = [[NSDate date]timeIntervalSince1970];
    for (NSInteger row2=0; row2<Size;row2++) {
        [self performRegisterClassNVTableViewCell:row2];
    }
    double endTime = [[NSDate date]timeIntervalSince1970];
    NSLog(@"%f====%f", (endTime-midTime)*1000, (midTime-starTime)*1000);
//    XCTAssertGreaterThanOrEqual((endTime-midTime)*1000, (midTime-starTime)*1000);
}
- (void)performNVTableViewCell:(NSInteger)row{
    NVTableViewCell *cell = (NVTableViewCell*)[self.myTableView dequeueReusableCellWithIdentifier:curidentifier];
    if (cell == nil) {
        cell = [[NVTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:curidentifier];
    }
    cell.logoImage.image = [UIImage imageNamed:@"cc.png"];
    cell.logoLabel.text = [NSString stringWithFormat:@"%@%@" , NSStringFromSelector(_cmd) , @(row)];
}
- (void)performRegisterClassNVTableViewCell:(NSInteger)row{
    NVTableViewCell *cell = (NVTableViewCell*)[self.myTableView dequeueReusableCellWithIdentifier:identifier];
    cell.logoImage.image = [UIImage imageNamed:@"cc.png"];
    cell.logoLabel.text = [NSString stringWithFormat:@"%@%@" , NSStringFromSelector(_cmd) , @(row)];
}

@end
