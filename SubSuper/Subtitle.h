//
//  Subtitle.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Subtitle : NSObject

@property NSMutableString *block;
@property NSInteger       blockDuration;
@property NSInteger       timeCode;

- (NSString *)stringValueInPosition:(NSInteger)position;

@end
