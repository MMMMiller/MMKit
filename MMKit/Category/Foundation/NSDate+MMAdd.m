//
//  NSDate+MMAdd.m
//  MMKitDemo
//
//  Created by xueMingLuan on 2018/2/26.
//  Copyright © 2018年 mille. All rights reserved.
//

#import "NSDate+MMAdd.h"

@implementation NSDate (MMAdd)

- (NSString *)dateStringWithFormatter:(NSString *)format {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:format];
    return [dateFormatter stringFromDate:self];
}

@end
