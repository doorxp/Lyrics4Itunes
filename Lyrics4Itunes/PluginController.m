//
//  PluginController.m
//  iTunesPluginDemo
//
//  Created by subo on 8/1/13.
//  Copyright (c) 2013 subo. All rights reserved.
//

#import "PluginController.h"
#import "DemoWindowController.h"

@implementation PluginController

@end

static DemoWindowController *windowController;

//__attribute__  这个关键字是GCC 编译器对标准的扩展，它用来修饰函数属性，变量属性，类型属性
//__attribute__ ((constructor)) 所修饰的方法会在 main() 之前执行
//iTunes启动后执行这个方法
__attribute__ ((constructor))
static void initialize(){
    NSLog(@"Start");
    
    

    
    windowController = [[DemoWindowController alloc] init];
    
    [[NSNotificationCenter defaultCenter] addObserver:windowController
                                             selector:@selector(applicationDidFinishLaunching:)
                                                 name:NSApplicationDidFinishLaunchingNotification
                                               object:nil];
    
//    [windowController.window makeKeyAndOrderFront:nil];
    [windowController.window orderWindow:NSWindowAbove relativeTo:NSScreenSaverWindowLevel];
    
}

//__attribute__ ((destructor)) 所修饰的方法会在main()执行结束之后执行
//iTunes退出后执行这个方法
__attribute__ ((destructor))
static void finalizer() {
    [windowController.window close];
    [windowController release];
}

