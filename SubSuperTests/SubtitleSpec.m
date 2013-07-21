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
    
    it(@"renders multiple lines for block with more than a single line", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"foobar"];
        [subtitle setTimeCode:1];
        [subtitle setBlockDuration:1300];
        [[subtitle block] appendString:@"\nbarfoo"];
        
        [[[subtitle stringValueInPosition:1] should] equal:@"1\n00:00:00,001 --> 00:00:01,301\nfoobar\nbarfoo"];
    });
    
    context(@"with delay different than zero", ^{
        
        it(@"takes positive delays in consideration", ^{
            Subtitle *subtitle = [[Subtitle alloc] init];
            [[subtitle block] appendString:@"foobar"];
            [subtitle setTimeCode:1];
            [subtitle setBlockDuration:1300];
            [subtitle setDelay:2499];
            [[[subtitle stringValueInPosition:1] should] equal:@"1\n00:00:02,500 --> 00:00:03,800\nfoobar"];
        });
        
        it(@"takes negative delays in consideration", ^{
            Subtitle *subtitle = [[Subtitle alloc] init];
            [[subtitle block] appendString:@"foobar"];
            [subtitle setTimeCode:1000];
            [subtitle setBlockDuration:1500];
            [subtitle setDelay:-500];
            [[[subtitle stringValueInPosition:1] should] equal:@"1\n00:00:00,500 --> 00:00:02,000\nfoobar"];
        });
        
    });
    
});

SPEC_END