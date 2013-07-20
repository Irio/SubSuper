//
//  Subtitle.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "Subtitle.h"

@implementation Subtitle

- (id)init
{
    id obj = [super init];
    [(Subtitle *)obj setBlock:[[NSMutableString alloc] init]];
    return obj;
}

@end
