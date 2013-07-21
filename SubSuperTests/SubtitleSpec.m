//
//  SubtitleSpec.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Kiwi.h"
#import "Subtitle.h"

SPEC_BEGIN(SubtitleSpec)

describe(@"- stringValue", ^{
    
    it(@"returns the subtitle line in the SubRip format", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"foobar"];
        [subtitle setTimeCode:1];
        [subtitle setBlockDuration:1300];
        
        [[[subtitle stringValueInPosition:1] should] equal:@"1\n00:00:00,001 --> 00:00:01,301\nfoobar"];
    });
    
});

SPEC_END