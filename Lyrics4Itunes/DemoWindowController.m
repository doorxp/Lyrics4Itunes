//
//  DemoWindowController.m
//  iTunesPluginDemo
//
//  Created by subo on 8/1/13.
//  Copyright (c) 2013 subo. All rights reserved.
//

#import "DemoWindowController.h"

@interface DemoWindowController ()

@end

@implementation DemoWindowController

- (id)init
{
    self = [super initWithWindowNibName:@"Window" owner:self];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}

@end
