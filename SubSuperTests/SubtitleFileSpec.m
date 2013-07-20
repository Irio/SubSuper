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
    
    it(@"returns a collection of Subtitles", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subject = [SubtitleFile parseFrom:path];
        [[[subject should] have:2] subtitles];
    });
    
    it(@"assigns the subtitle attributes", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subtitleFile = [SubtitleFile parseFrom:path];
        Subtitle *subject = [[subtitleFile subtitles] objectAtIndex:1];
        [[[subject block] should] equal:@"Very good, Lieutenant."];
        [[theValue([subject timeCode]) should] equal:theValue(140476)];
        [[theValue([subject blockDuration]) should] equal:theValue(2025)];
    });
    
    it(@"scans multiple-text subtitle attributes", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subtitleFile = [SubtitleFile parseFrom:path];
        Subtitle *subject = [[subtitleFile subtitles] objectAtIndex:0];
        [[[subject block] should] equal:@"Senator, we're making\nour final approach into Coruscant."];
    });
});

SPEC_END