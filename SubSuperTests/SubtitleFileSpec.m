//
//  SubtitleFileSpec.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Kiwi.h"
#import "SubtitleFile.h"

SPEC_BEGIN(SubtitleFileSpec)

context(@"parsing", ^{
    
    it(@"populates the collection of Subtitles", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                         ofType:@"srt"];
        SubtitleFile *subject = [SubtitleFile parseFrom:path];
        [[[subject subtitles] should] haveCountOf:2];
    });
    
});

SPEC_END