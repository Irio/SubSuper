//
//  Subtitle.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Subtitle.h"

@implementation Subtitle

- (id)init
{
    id obj = [super init];
    [(Subtitle *)obj setBlock:[[NSMutableString alloc] init]];
    return obj;
}

- (NSString *)stringValueInPosition:(NSInteger)position
{
    NSString *startTime;
    NSInteger hours, minutes, seconds, milliseconds, remainingTime;
    hours         = self.timeCode / 3600000;
    remainingTime = self.timeCode % 3600000;
    minutes       = remainingTime / 60000;
    remainingTime = remainingTime % 60000;
    seconds       = remainingTime / 1000;
    milliseconds  = remainingTime % 1000;
    startTime = [NSString stringWithFormat:@"%02ld:%02ld:%02ld,%03ld", hours, minutes, seconds, milliseconds];
    
    hours         = (self.timeCode + self.blockDuration) / 3600000;
    remainingTime = (self.timeCode + self.blockDuration) % 3600000;
    minutes       = remainingTime / 60000;
    remainingTime = remainingTime % 60000;
    seconds       = remainingTime / 1000;
    milliseconds  = remainingTime % 1000;
    
    return [NSString stringWithFormat:@"%ld\n%@ --> %02ld:%02ld:%02ld,%03ld\n%@", position, startTime, hours, minutes, seconds, milliseconds, self.block];
}

@end
