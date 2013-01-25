//
//  MainView.h
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#include <iostream>
#include <string>
#include <sstream>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <netinet/in.h>
#include <netinet/tcp.h>


@interface MainView : NSViewController
{
    IBOutlet NSTextField *txtConnection;
    int skt;
    bool connected,_read;
    bool bx,by,bbtn1,bbtn2;
    std::string _buffer;
    NSUserDefaults *prefs;
    IBOutlet NSSlider *th;
}
-(void)readPrefs;
-(void) getNewSession;
-(void) connectToServer;
-(void) disconnectFromServer;
-(void) SendData:(NSString*)message;
-(void) ReadData;
-(void) Parse:(NSString*)message;
-(IBAction)clickReload:(id)sender;
-(IBAction)clickQuit:(id)sender;
-(IBAction)clickThreshold:(id)sender;
@property (nonatomic,retain) IBOutlet NSTextField *txtConnection;
@property (nonatomic,retain) IBOutlet NSSlider *th;
@end
