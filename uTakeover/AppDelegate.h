//
//  AppDelegate.h
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainView.h"
#import "BindView.h"

@interface AppDelegate : NSObject <NSApplicationDelegate,NSWindowDelegate>
{
    IBOutlet NSView *_view,*_setview;
    NSStatusItem * statusItem;
    
    NSImageView *settingsBG;
    NSImage *imgSettings,*imgBind;
    NSImageView *imgSync;
    
    IBOutlet NSButton *btnSettings,*btnBind;
    
    MainView *vcSettings;
    BindView *vcBind;
    
    NSImageView *imgQR;
    NSButton *btnQR;
    
    int _activeuser;
}
@property (assign) IBOutlet NSWindow *window;
@property (nonatomic,retain) IBOutlet NSView *_view,*_setview;
@property (nonatomic,retain) IBOutlet NSButton *btnSettings,*btnBind;
-(void)clickIcon;
-(void)clickQR;
-(IBAction)clickBind:(id)sender;
-(IBAction)clickSettings:(id)sender;
-(IBAction)clickSync:(id)sender;
-(IBAction)clickGetUkontroll:(id)sender;


-(void) setActive;
-(void) setNotActive;
@end
