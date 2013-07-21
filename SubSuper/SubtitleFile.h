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

- (id)initWithSubtitles:(NSMutableArray *)subtitles;
+ (SubtitleFile *)loadFrom:(NSString *)filePath;
- (void)saveTo:(NSString *)filePath;

@property             NSMutableArray *subtitles;
@property (nonatomic) NSInteger      delay;

@end
