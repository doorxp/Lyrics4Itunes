//
//  DemoWindowController.m
//  iTunesPluginDemo
//
//  Created by subo on 8/1/13.
//  Copyright (c) 2013 subo. All rights reserved.
//

#import "LyricsWindowController.h"

@interface LyricsWindowController ()

- (void) applicationDidFinishLaunching: (NSNotification*) noti;
@end

@implementation LyricsWindowController

- (id)init
{
    self = [super initWithWindowNibName:@"Window" owner:self];
    if (self) {
        // Initialization code here.
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(applicationDidFinishLaunching:)
                                                     name:NSApplicationDidFinishLaunchingNotification
                                                   object:nil];
        
        [self.window setCanHide:NO];
        [self.window setLevel:NSStatusWindowLevel];
        [self.window setOrderedIndex:0];
        [self.window setCollectionBehavior:NSWindowCollectionBehaviorMoveToActiveSpace];
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}


- (void)show
{
    [self.window makeKeyAndOrderFront:self];
}

- (void) applicationDidFinishLaunching: (NSNotification*) noti {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(selectionDidChange:)
                                                 name:NSTextViewDidChangeSelectionNotification
                                               object:nil];
    NSMenuItem *editMenuItem = [[NSApp mainMenu] itemWithTitle:@"Edit"];
    [NSApp activateIgnoringOtherApps:YES];
    if (editMenuItem) {
        [[editMenuItem submenu] addItem:[NSMenuItem separatorItem]];
        NSMenuItem *newMenuItem =
        [[NSMenuItem alloc] initWithTitle:NSLocalizedString(@"s10000", nil)
                                   action:@selector(showSelected:)
                            keyEquivalent:@""];
        [newMenuItem setTarget:self];
        [newMenuItem setKeyEquivalentModifierMask: NSAlternateKeyMask];
        [[editMenuItem submenu] addItem:newMenuItem];
        [newMenuItem release];
    }
    [self.window setCanHide:NO];
}

-(void) selectionDidChange:(NSNotification *)noti {
    //Nothing now. Just in case of crash.
}

-(void) showSelected:(NSMenuItem *)noti {
    //Nothing now. Just in case of crash.
    if([noti state] == true)[noti setState:NO];
    else [noti setState:true];
    [self.window setIsVisible:[noti state] != NO];
}

@end
