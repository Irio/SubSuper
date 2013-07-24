//
//  AppDelegate.h
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SubtitleFile.h"
#import "SubRipFormat.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *timeField;
- (IBAction)doShift:(id)sender;

@property NSString *selectedSubtitlePath;

@end
