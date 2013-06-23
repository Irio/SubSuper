//
//  SubtitleFile.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "SubtitleFile.h"

@implementation SubtitleFile

+ (SubtitleFile *)parseFrom:(NSString *)filePath
{
    NSString *fileContent = [NSString stringWithContentsOfFile:filePath
                                                      encoding:NSUTF8StringEncoding
                                                         error:nil];
    NSArray *fileLines = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]];
    
    SubtitleFile *subtitleFile = [[SubtitleFile alloc] init];
    for (NSString *subtitleString in fileLines) {
        
    }
    
    return subtitleFile;
}

@end
