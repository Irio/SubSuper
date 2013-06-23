//
//  SubtitleFile.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubtitleFile : NSObject

+ (SubtitleFile *)parseFrom:(NSString *)filePath;

@property NSArray *subtitles;

@end
