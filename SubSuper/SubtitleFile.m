//
//  SubtitleFile.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "SubtitleFile.h"

@implementation SubtitleFile

- (id)initWithSubtitles:(NSMutableArray *)subtitles;
{
    id obj = [super init];
    [(SubtitleFile *)obj setSubtitles:subtitles];
    return obj;
}

+ (SubtitleFile *)loadFrom:(NSString *)filePath
{
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath
                                                      encoding:NSUTF8StringEncoding
                                                         error:nil];
    NSArray *fileLines = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    SubtitleFile *subtitleFile = [[SubtitleFile alloc] init];
    Subtitle     *subtitle;
    subtitleFile.subtitles = [[NSMutableArray alloc] init];
    
    for (NSString *subtitleString in fileLines) {
        FileLineParser *parsedLine = [FileLineParser initWithLine:subtitleString];
        
        if (parsedLine.type == SubtitlePositionLine) {
            subtitle = [[Subtitle alloc] init];
            [subtitleFile.subtitles addObject:subtitle];
        }
        
        if (parsedLine.type == TimeLine) {
            subtitle.blockDuration = parsedLine.blockDuration;
            subtitle.timeCode      = parsedLine.timeCode;
        }
        
        if (parsedLine.type == TextLine) {
            if (![subtitle.block isEqualToString:@""])
                [subtitle.block appendString:@"\n"];
            
            [subtitle.block appendString:parsedLine.block];
        }
    }
    
    return subtitleFile;
}

- (void)saveTo:(NSString *)filePath
{
    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    [[NSFileManager defaultManager] createFileAtPath:filePath contents:nil attributes:nil];
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:filePath];
    
    NSString *subtitleLine;
    for (Subtitle *subtitle in self.subtitles) {
        NSInteger position = [self.subtitles indexOfObject:subtitle];
        subtitleLine = [NSString stringWithFormat:@"%@\n\n", [subtitle stringValueInPosition:position]];
        [fileHandle writeData:[subtitleLine dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [fileHandle closeFile];
}

- (void)setDelay:(NSInteger)delay
{
    _delay = delay;
    for (Subtitle *subtitle in self.subtitles) {
        [subtitle setDelay:delay];
    }
}

@end
