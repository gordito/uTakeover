//
//  AppDelegate.m
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize _view,_setview,btnBind,btnSettings;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setAction:@selector(clickIcon)];
    [statusItem setImage:[[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"utakeover-icon-18" ofType:@"png"]]];
    
    [_window setAcceptsMouseMovedEvents:YES];
    [_window setMovableByWindowBackground:YES];
    [_window setLevel:NSNormalWindowLevel];
    
    [_window setOpaque:NO];
    [_window setBackgroundColor:[NSColor colorWithCalibratedWhite:1.0 alpha:0.0]];
    
    NSImageView *imgBG = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 320, 432)];
    imgBG.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"utakeover-bg" ofType:@"png"]];
    [_view addSubview:imgBG positioned:NSWindowBelow relativeTo:nil];
    
    settingsBG = [[NSImageView alloc] initWithFrame:NSMakeRect(25, 68, 270, 194)];
    imgBind = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bindings-bg" ofType:@"png"]];
    imgSettings = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"settings-bg" ofType:@"png"]];
    settingsBG.image = imgSettings;
    [_view addSubview:settingsBG positioned:NSWindowAbove relativeTo:imgBG];
    
    vcBind = [[BindView alloc] initWithNibName:@"BindView" bundle:nil];
    vcSettings = [[MainView alloc] initWithNibName:@"MainView" bundle:nil];
    [_setview addSubview:vcSettings.view];
    
    
    imgSync = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 0, 36, 36)];
    imgSync.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"active-session" ofType:@"png"]];
    [imgSync setHidden:YES];
    [_view addSubview:imgSync positioned:NSWindowAbove relativeTo:nil];
}

-(void)clickIcon
{
    NSPoint mouseLoc;
    mouseLoc = [NSEvent mouseLocation];
    [_window setFrame:NSMakeRect(mouseLoc.x-35, [[NSScreen mainScreen] frame].size.height-_window.frame.size.height-25, _window.frame.size.width, _window.frame.size.height) display:YES];
    [_window setIsVisible:YES];
    [_window makeKeyAndOrderFront:self];
    [NSApp activateIgnoringOtherApps:YES];
}


-(void) windowDidMove:(NSNotification *)notification
{
    
}

-(IBAction)clickBind:(id)sender
{
    settingsBG.image = imgBind;
    [vcSettings.view removeFromSuperview];
    [_setview addSubview:vcBind.view];
}
-(IBAction)clickSettings:(id)sender
{
    settingsBG.image = imgSettings;
    [vcBind.view removeFromSuperview];
    [_setview addSubview:vcSettings.view];
}

-(IBAction)clickSync:(id)sender
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://ukontroll.com/?header=ajax&qr=%@",[prefs objectForKey:@"utakeover-session"]]];
    NSData *imageData = [imageURL resourceDataUsingCache:NO];
    NSImage *qr = [[NSImage alloc] initWithData:imageData];
    
    btnQR = [[NSButton alloc] initWithFrame:NSMakeRect(25, -300, 270, 270)];
    [[btnQR cell] setImageScaling:NSImageScaleProportionallyDown];
    [btnQR setImage:qr];
    [btnQR setAction:@selector(clickQR)];
    [_view addSubview:btnQR positioned:NSWindowAbove relativeTo:nil];
    
    
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.3f];
    [[btnQR animator] setFrame:NSMakeRect(btnQR.frame.origin.x, btnQR.frame.origin.y+325, btnQR.frame.size.width, btnQR.frame.size.height)];
    [NSAnimationContext endGrouping];
}

-(void)clickQR
{
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.3f];
    [[btnQR animator] setFrame:NSMakeRect(btnQR.frame.origin.x, btnQR.frame.origin.y-325, btnQR.frame.size.width, btnQR.frame.size.height)];
    [NSAnimationContext endGrouping];
    [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(resetQR) userInfo:nil repeats:NO];
    [self clickBind:self];
}
-(void)resetQR
{
    [btnQR removeFromSuperview];
    imgQR.image = nil;
}


-(void) setActive
{
    _activeuser++;
    if(_activeuser>0)
    {
        [imgSync setHidden:NO];
        [statusItem setImage:[[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"utakeover-icon-18-active" ofType:@"png"]]];
    }
}
-(void) setNotActive
{
    _activeuser--;
    if(_activeuser<=0)
    {
        [imgSync setHidden:YES];
        [statusItem setImage:[[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"utakeover-icon-18" ofType:@"png"]]];
    }
    if(_activeuser<0)
        _activeuser=0;
}
-(IBAction)clickGetUkontroll:(id)sender
{
    NSURL *url = [NSURL URLWithString:@"http://ukontroll.com/"];
    if( ![[NSWorkspace sharedWorkspace] openURL:url] )
        NSLog(@"Failed to open url: %@",[url description]);
}


@end
