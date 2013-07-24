//
//  SubRipFormatSpec.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 21/07/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Kiwi.h"
#import "SubRipFormat.h"

SPEC_BEGIN(SubRipFormatSpec)

describe(@"+ parseTime:", ^{
    
    it(@"returns the number of milliseconds in the specific time", ^{
        [[theValue([SubRipFormat parseTime:@"01:02:03,004"]) should] equal:theValue(3723004)];
    });
    
    it(@"accepts an optional + sign at start of the string", ^{
        [[theValue([SubRipFormat parseTime:@"+01:02:03,004"]) should] equal:theValue(3723004)];
    });
    
    it(@"accepts an optional - sign at start of the string", ^{
        [[theValue([SubRipFormat parseTime:@"-01:02:03,004"]) should] equal:theValue(-3723004)];
    });
    
});

describe(@"+ parseTimeLine:", ^{
    
    NSDictionary *parseResult = [SubRipFormat parseTimeLine:@"01:02:03,004 --> 10:20:30,400"];
    
    it(@"parses time code of a line", ^{
        [[[parseResult objectForKey:@"timeCode"] should] equal:theValue(3723004)];
    });
    
    it(@"parses block duration of a line", ^{
        [[[parseResult objectForKey:@"blockDuration"] should] equal:theValue(33507396)];
    });
    
});

SPEC_END