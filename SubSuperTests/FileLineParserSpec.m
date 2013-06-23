//
//  FileLineParserSpec.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Kiwi.h"
#import "FileLineParser.h"

SPEC_BEGIN(FileLineParserSpec)

describe(@"initialization through initWithLine:", ^{
    
    it(@"initializes the line attribute", ^{
        FileLineParser *subject = [FileLineParser initWithLine:@"1"];
        [[subject.line should] equal:@"1"];
    });
});

context(@"number of subtitle sequence line", ^{
  
    describe(@"type method", ^{
        
        it(@"returns SubtitlePositionLine", ^{
            FileLineParser *subject = [FileLineParser initWithLine:@"1"];
            [[theValue(subject.type) should] equal:theValue(SubtitlePositionLine)];
        });
        
    });
    
});

context(@"text line", ^{
    
    describe(@"type method", ^{
        
        it(@"returns TextLine", ^{
            FileLineParser *subject = [FileLineParser initWithLine:@"Senator, we're making"];
            [[theValue(subject.type) should] equal:theValue(TextLine)];
        });
        
    });
    
});

context(@"time line", ^{
    
    describe(@"type method", ^{
        
        it(@"returns TimeLine", ^{
            FileLineParser *subject = [FileLineParser initWithLine:@"00:02:17,440 --> 00:02:20,375"];
            [[theValue(subject.type) should] equal:theValue(TimeLine)];
        });
        
    });
    
});

context(@"subtitle separation line", ^{
    
    describe(@"type method", ^{
        
        it(@"returns SubtitleSeparationLine", ^{
            FileLineParser *subject = [FileLineParser initWithLine:@""];
            [[theValue(subject.type) should] equal:theValue(SubtitleSeparationLine)];
        });
        
    });
    
});

SPEC_END