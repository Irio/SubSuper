//
//  FileLineParser.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "FileLineParser.h"

@implementation FileLineParser

+ (FileLineParser *)initWithLine:(NSString *)line
{
    FileLineParser *fileLineParser = [[FileLineParser alloc] init];
    [fileLineParser setLine:line];
    [fileLineParser setType:UnidentifiedLine];
    
    [fileLineParser tryMatchSubtitleSeparationLine];
    if (fileLineParser.type == UnidentifiedLine)
        [fileLineParser tryMatchSubtitlePositionLine];
    if (fileLineParser.type == UnidentifiedLine)
        [fileLineParser tryMatchTimeLine];
    if (fileLineParser.type == UnidentifiedLine)
        [fileLineParser tryMatchTextLine];
    
    return fileLineParser;
}

- (void)tryMatchSubtitlePositionLine
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\A\\d\\z"
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:self.line
                                      options:0
                                        range:NSMakeRange(0, [self.line length])];
    if ([matches count])
        self.type = SubtitlePositionLine;
}

- (void)tryMatchTimeLine
{
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\A\\d{2}:\\d{2}:\\d{2},\\d{3} --> \\d{2}:\\d{2}:\\d{2},\\d{3}\\z"
                                                                           options:0
                                                                             error:nil];
    NSArray *matches = [regex matchesInString:self.line
                                      options:0
                                        range:NSMakeRange(0, [self.line length])];
    if ([matches count])
        self.type = TimeLine;
}

- (void)tryMatchTextLine
{
    if ([self.line length] > 1)
        self.type = TextLine;
}

- (void)tryMatchSubtitleSeparationLine
{
    if ([self.line length] == 0)
        self.type = SubtitleSeparationLine;
}

@end
