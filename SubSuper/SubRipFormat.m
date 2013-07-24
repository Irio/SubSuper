//
//  SubRipFormat.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 21/07/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "SubRipFormat.h"

@implementation SubRipFormat

+ (NSInteger)parseTime:(NSString *)timeAsString
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\A((?:\\+*)(?:\\-*))(\\d{2}):(\\d{2}):(\\d{2}),(\\d{3})\\z"
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:timeAsString
                                      options:0
                                        range:NSMakeRange(0, [timeAsString length])];
    NSInteger timeInMS;
    if ([matches count]) {
        NSTextCheckingResult *result = matches[0];
        timeInMS  = [[timeAsString substringWithRange:[result rangeAtIndex:5]] integerValue];           // milliseconds
        timeInMS += [[timeAsString substringWithRange:[result rangeAtIndex:4]] integerValue] * 1000;    // seconds
        timeInMS += [[timeAsString substringWithRange:[result rangeAtIndex:3]] integerValue] * 60000;   // minutes
        timeInMS += [[timeAsString substringWithRange:[result rangeAtIndex:2]] integerValue] * 3600000; // hours
        
        return ([[timeAsString substringWithRange:[result rangeAtIndex:1]] isEqualToString:@"-"] ? -timeInMS : timeInMS);
    } else {
        return 0;
    }
}

+ (NSDictionary *)parseTimeLine:(NSString *)timeLine
{   
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\A(\\d{2}):(\\d{2}):(\\d{2}),(\\d{3}) --> (\\d{2}):(\\d{2}):(\\d{2}),(\\d{3})\\z"
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:timeLine
                                      options:0
                                        range:NSMakeRange(0, [timeLine length])];
    NSInteger startTimeInMS, endTimeInMS;
    if ([matches count]) {
        NSTextCheckingResult *result = matches[0];
        startTimeInMS  = [[timeLine substringWithRange:[result rangeAtIndex:4]] integerValue];           // milliseconds
        startTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:3]] integerValue] * 1000;    // seconds
        startTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:2]] integerValue] * 60000;   // minutes
        startTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:1]] integerValue] * 3600000; // hours
        
        endTimeInMS  = [[timeLine substringWithRange:[result rangeAtIndex:8]] integerValue];           // milliseconds
        endTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:7]] integerValue] * 1000;    // seconds
        endTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:6]] integerValue] * 60000;   // minutes
        endTimeInMS += [[timeLine substringWithRange:[result rangeAtIndex:5]] integerValue] * 3600000; // hours
        
        return @{ @"timeCode":      [NSNumber numberWithInteger:startTimeInMS],
                  @"blockDuration": [NSNumber numberWithInteger:(endTimeInMS - startTimeInMS)] };
    } else {
        return nil;
    }
}

@end
