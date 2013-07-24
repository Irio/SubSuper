//
//  AppDelegate.m
//  SubSuper
//
//  Created by Irio Irineu Musskopf Junior on 22/06/13.
//  Copyright (c) 2013 Irio Irineu Musskopf Junior. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [self openFileDialog];
}

- (void)openFileDialog
{
    NSOpenPanel *filePanel = [NSOpenPanel openPanel];
    [filePanel setAllowedFileTypes:@[@"srt"]];
    [filePanel setCanChooseFiles:YES];
    
    if ([filePanel runModal] == NSFileHandlingPanelOKButton) {
        self.selectedSubtitlePath = [[[filePanel URLs] objectAtIndex:0] path];
    };
}

- (IBAction)doShift:(id)sender {
    NSString *selectedTime = [self.timeField stringValue];
    
    SubtitleFile *subtitleFile = [SubtitleFile loadFrom:self.selectedSubtitlePath];
    [subtitleFile setDelay:[SubRipFormat parseTime:selectedTime]];
    [subtitleFile saveTo:self.selectedSubtitlePath];
    
    NSString *alertMessage = [NSString stringWithFormat:@"%@ shifted in %@", self.selectedSubtitlePath, selectedTime];
    NSAlert *alert = [NSAlert alertWithMessageText:alertMessage
                                     defaultButton:@"Close"
                                   alternateButton:nil
                                       otherButton:nil
                         informativeTextWithFormat:@""];
    [alert runModal];
}
@end
