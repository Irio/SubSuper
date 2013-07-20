//
//  FileLineParser.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FileLineParser : NSObject

typedef NS_ENUM(NSUInteger, LineType) {
    UnidentifiedLine,
    SubtitlePositionLine,
    TimeLine,
    SubtitleSeparationLine,
    TextLine
};

+ (FileLineParser *)initWithLine:(NSString *)line;

@property NSString *line;
@property LineType type;

// Subtitle's attributes
@property NSString  *block;
@property NSInteger blockDuration;
@property NSInteger timeCode;

@end
