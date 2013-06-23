//
//  SubtitleFile.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileLineParser.h"
#import "Subtitle.h"

@interface SubtitleFile : NSObject

+ (SubtitleFile *)parseFrom:(NSString *)filePath;

@property NSMutableArray *subtitles;

@end
