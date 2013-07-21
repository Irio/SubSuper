//
//  SubRipFormat.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 21/07/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SubRipFormat : NSObject

+ (NSInteger)parseTime:(NSString *)timeAsString;
+ (NSDictionary *)parseTimeLine:(NSString *)timeLine;

@end
