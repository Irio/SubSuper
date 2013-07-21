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

describe(@"+ loadFrom:", ^{
    
    it(@"returns a collection of Subtitles", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subject = [SubtitleFile loadFrom:path];
        [[[subject should] have:2] subtitles];
    });
    
    it(@"assigns the subtitle attributes", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subtitleFile = [SubtitleFile loadFrom:path];
        Subtitle *subject = [[subtitleFile subtitles] objectAtIndex:1];
        
        [[[subject block] should] equal:@"Very good, Lieutenant."];
        [[theValue([subject timeCode]) should] equal:theValue(140476)];
        [[theValue([subject blockDuration]) should] equal:theValue(2025)];
    });
    
    it(@"scans multiple-text subtitle attributes", ^{
        NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"subtitle_file_fixture"
                                                                          ofType:@"srt"];
        SubtitleFile *subtitleFile = [SubtitleFile loadFrom:path];
        Subtitle *subject = [[subtitleFile subtitles] objectAtIndex:0];
        [[[subject block] should] equal:@"Senator, we're making\nour final approach into Coruscant."];
    });
});

describe(@"- setDelay:", ^{
    
    it(@"changes the value of subtitleFile's delay", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit"];
        [subtitle setTimeCode:0];
        [subtitle setBlockDuration:1300];
        NSMutableArray *subtitles  = [[NSMutableArray alloc] initWithArray:@[subtitle]];
        SubtitleFile *subtitleFile = [[SubtitleFile alloc] initWithSubtitles:subtitles];
        [subtitleFile setDelay:42];
        [[theValue(subtitleFile.delay) should] equal:theValue(42)];
    });
    
    it(@"changes the value of subtitles' delay", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit"];
        [subtitle setTimeCode:0];
        [subtitle setBlockDuration:1300];
        NSMutableArray *subtitles  = [[NSMutableArray alloc] initWithArray:@[subtitle]];
        SubtitleFile *subtitleFile = [[SubtitleFile alloc] initWithSubtitles:subtitles];
        [subtitleFile setDelay:42];
        [[theValue(subtitle.delay) should] equal:theValue(42)];
    });
    
});

describe(@"- saveTo:", ^{
    
    it(@"creates a file", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit"];
        [subtitle setTimeCode:0];
        [subtitle setBlockDuration:1300];
        NSMutableArray *subtitles  = [[NSMutableArray alloc] initWithArray:@[subtitle]];
        SubtitleFile *subtitleFile = [[SubtitleFile alloc] initWithSubtitles:subtitles];
        
        [subtitleFile saveTo:@"/tmp/SubSuper.srt"];
        [[theValue([[NSFileManager defaultManager] fileExistsAtPath:@"/tmp/SubSuper.srt"]) shouldNot] equal:theValue(NO)];
    });
    
    it(@"separates each subtitle by an empty line", ^{
        Subtitle *subtitle = [[Subtitle alloc] init];
        [[subtitle block] appendString:@"Lorem ipsum dolor sit amet, consectetur adipisicing elit"];
        [subtitle setTimeCode:0];
        [subtitle setBlockDuration:1300];
        
        [subtitle stub:@selector(stringValueInPosition:)
             andReturn:@"a_string_version_of_a_subtitle"];
        
        NSMutableArray *subtitles  = [[NSMutableArray alloc] initWithArray:@[subtitle, subtitle]];
        SubtitleFile *subtitleFile = [[SubtitleFile alloc] initWithSubtitles:subtitles];
        
        [subtitleFile saveTo:@"/tmp/SubSuper.srt"];
        [[[NSString stringWithContentsOfFile:@"/tmp/SubSuper.srt"
                                    encoding:NSUTF8StringEncoding
                                       error:nil] should] startWithString:@"a_string_version_of_a_subtitle\n\na_string_version_of_a_subtitle"];
    });
});

SPEC_END