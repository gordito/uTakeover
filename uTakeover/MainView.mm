//
//  MainView.m
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import "MainView.h"
#import "AppDelegate.h"

@interface MainView ()

@end

@implementation MainView

@synthesize txtConnection, th;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        prefs = [NSUserDefaults standardUserDefaults];
        
        /*if([[prefs objectForKey:@"utakeover-session"] length]>0)
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(connectToServer) userInfo:nil repeats:NO];
        else*/
            [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getNewSession) userInfo:nil repeats:NO];
        
        bx=by=bbtn1=bbtn2=false;
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(readPrefs) userInfo:nil repeats:NO];
    }
    
    return self;
}
-(void)readPrefs
{
    [th setIntegerValue:[prefs integerForKey:@"utakeover-threshold"]];
}
-(void) getNewSession
{
    @try
    {
        [txtConnection setStringValue:@"connecting..."];
        [[txtConnection cell] setLineBreakMode:NSLineBreakByClipping];
        
        NSError* error;
        NSString *content = [[NSString alloc] initWithContentsOfURL:[NSURL URLWithString:@"http://ukontroll.com/?com=newsession&controller=std1&apikey=6b0c0b49752dcddef1ab38a86d5bf761d73f1b4c"] encoding:NSUTF8StringEncoding error:&error];
        
        NSString *ip,*token,*session;
        NSArray *arr = [content componentsSeparatedByString:@"&"];
        
        for (id obj in arr)
        {
            if(obj==nil) continue;
            NSString *re = (NSString*)obj;
            
            if([[re substringToIndex:3] isEqualToString:@"ip="])
            {
                ip=[[NSString alloc] initWithString:[re substringFromIndex:3]];
            }
            else if([[re substringToIndex:6] isEqualToString:@"token="])
            {
                token=[[NSString alloc] initWithString:[re substringFromIndex:6]];
            }
            else if([[re substringToIndex:8] isEqualToString:@"session="])
            {
                session=[[NSString alloc] initWithString:[re substringFromIndex:8]];
            }
        }
        if([session length]>0)
        {
            [prefs setObject:[NSString stringWithFormat:@"%@",ip] forKey:@"utakeover-ip"];
            [prefs setObject:[NSString stringWithFormat:@"%@",token] forKey:@"utakeover-token"];
            [prefs setObject:[NSString stringWithFormat:@"%@",session] forKey:@"utakeover-session"];
            [prefs synchronize];
            
            [self connectToServer];
        }
        else
        {
            [txtConnection setTextColor:[NSColor redColor]];
            [txtConnection setStringValue:@"Error"];
        }
    
    }
    @catch (NSException *e) {
        NSLog(@"GetNewSession Exception %@",e);
    }
}

-(void) connectToServer
{
    
    connected=false;

    //NSLog(@"Connect to session: %@",[prefs objectForKey:@"utakeover-session"]);
    
    @try {
        struct addrinfo hints, *res;
        
        memset(&hints, 0, sizeof hints);
        hints.ai_family = AF_UNSPEC;
        hints.ai_socktype = SOCK_STREAM;
        
        getaddrinfo([[prefs objectForKey:@"utakeover-ip"] UTF8String], "2511", &hints, &res);
        skt = socket(res->ai_family, res->ai_socktype, res->ai_protocol);
        
        if(skt<0)
            @throw @"Socket failed";
        
        int ndflag = 1;
        int result = setsockopt(skt,IPPROTO_TCP, TCP_NODELAY,(char *) &ndflag,sizeof(int));
        if (result < 0)
            @throw @"TCP_NODELAY failed";
        
        if(connect(skt, res->ai_addr, res->ai_addrlen)<0)
            @throw [NSString stringWithFormat:@"Socket connect error: %s",strerror(errno)];
        
        connected=true;
        
        NSString *lg = [[NSString alloc] initWithFormat:@"admin|%@;",[prefs objectForKey:@"utakeover-token"]];
        
        if (send(skt,[lg UTF8String],[lg length],0) < 0)
            @throw [NSString stringWithFormat:@"Send connect error: %s",strerror(errno)];
        
        [txtConnection setTextColor:[NSColor blackColor]];
        [txtConnection setStringValue:@"OK"];
        
        [NSThread detachNewThreadSelector:@selector(ReadData) toTarget:self withObject:nil];
        
    }
    @catch (NSException *exception) {
        NSLog(@"Socket exception: %@",[exception description]);
        
        [txtConnection setTextColor:[NSColor redColor]];
        [txtConnection setStringValue:@"Error"];
        
        [self disconnectFromServer];
    }
    
}

-(void) SendData:(NSString*)message
{
    if(connected)
    {
        if (send(skt,[message UTF8String],[message length],0) < 0)
        {
            NSLog(@"Send connect error: %s",strerror(errno));
            [self disconnectFromServer];
        }
    }
}


-(void) ReadData
{
    @try
    {
        _read=true;
        while(_read)
        {
            char buf[1025];
            memset(buf, 0, 1025);
            
            ssize_t ret = recv(skt,buf,sizeof(char)*1024,0);
            
            if (ret <= 0)
                break;
            
            std::string conv(buf);
            _buffer += conv;
            
            size_t start=0;
            for(size_t i=0;i<_buffer.size();i++)
            {
                if(_buffer[i]==';')
                {
                    std::string m = [self TrimString:_buffer.substr(start,i-start)];
                    start=i+1;
                    [self Parse:[NSString stringWithUTF8String:m.c_str()]];
                }
            }
            _buffer=_buffer.substr(start);
            
        }
    }
    @catch(NSException *e)
    {
        NSLog(@"ReadData Exception: %@",[e description]);
    }
    [self disconnectFromServer];
    _read=false;
}


-(void) Parse:(NSString*)message
{
    //NSLog(@"PARSE %@",message);
    NSArray *com = [message componentsSeparatedByString:@"|"];
    NSInteger player;
    NSInteger threshold = [prefs integerForKey:@"utakeover-threshold"];
    if([com count]>0)
    {
        for(int i=0;i<[com count];i++)
        {
            switch(i)
            {
                case 0:
                {
                    player = [[com objectAtIndex:i] integerValue];
                    if(player>4)
                        return;
                }
                break;
                case 1:
                {
                    if([[com objectAtIndex:i] isEqualToString:@"connected"])
                    {
                        
                        AppDelegate *d = (AppDelegate*)[[NSApplication sharedApplication] delegate];
                        [d setActive];
                        
                    }
                    else if([[com objectAtIndex:i] isEqualToString:@"disconnected"])
                    {
                        AppDelegate *d = (AppDelegate*)[[NSApplication sharedApplication] delegate];
                        [d setNotActive];
                    }
                    else
                    {
                        if([[com objectAtIndex:i] integerValue]>threshold)
                        {
                            bx=true;
                            CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-right-p%ld",player]], true);
                            CGEventPost(kCGHIDEventTap, btn);
                        }
                        else if([[com objectAtIndex:i] integerValue]<(threshold*-1))
                        {
                            bx=true;
                            CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-left-p%ld",player]], true);
                            CGEventPost(kCGHIDEventTap, btn);
                        }
                        else
                        {
                            if(bx)
                            {
                                bx=false;
                                CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-right-p%ld",player]], false);
                                CGEventPost(kCGHIDEventTap, btn);
                                
                                CGEventRef btn2 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-left-p%ld",player]], false);
                                CGEventPost(kCGHIDEventTap, btn2);
                            }
                        }
                    }
                }
                break;
                case 2:
                {
                    if([[com objectAtIndex:i] integerValue]>threshold)
                    {
                        by=true;
                        CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-up-p%ld",player]], true);
                        CGEventPost(kCGHIDEventTap, btn);
                    }
                    else if([[com objectAtIndex:i] integerValue]<(threshold*-1))
                    {
                        by=true;
                        CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-down-p%ld",player]], true);
                        CGEventPost(kCGHIDEventTap, btn);
                    }
                    else
                    {
                        if(by)
                        {
                            by=false;
                            CGEventRef btn = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-up-p%ld",player]], false);
                            CGEventPost(kCGHIDEventTap, btn);
                            CGEventRef btn2 = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-down-p%ld",player]], false);
                            CGEventPost(kCGHIDEventTap, btn2);
                        }
                    }
                }
                break;
                case 6:
                {
                    if([[com objectAtIndex:i] integerValue]>0)
                    {
                        bbtn1=true;
                        CGEventRef btna = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-btn1-p%ld",player]], true);
                        CGEventPost(kCGHIDEventTap, btna);
                    }
                    else if(bbtn1)
                    {
                        bbtn1=false;
                        CGEventRef btna = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-btn1-p%ld",player]], false);
                        CGEventPost(kCGHIDEventTap, btna);
                    }
                }
                break;
                    
                case 7:
                {
                    if([[com objectAtIndex:i] integerValue]>0)
                    {
                        bbtn2=true;
                        CGEventRef btna = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-btn2-p%ld",player]], true);
                        CGEventPost(kCGHIDEventTap, btna);
                    }
                    else if(bbtn2)
                    {
                        bbtn2=false;
                        CGEventRef btna = CGEventCreateKeyboardEvent (NULL, (CGKeyCode)[prefs integerForKey:[NSString stringWithFormat:@"utakeover-btn2-p%ld",player]], false);
                        CGEventPost(kCGHIDEventTap, btna);
                    }
                }
                break;
            }
        }
    }
}

-(void) disconnectFromServer
{
    [txtConnection setTextColor:[NSColor redColor]];
    [txtConnection setStringValue:@"Offline"];
    connected=false;
    close(skt);
}

-(IBAction)clickReload:(id)sender
{
    [self disconnectFromServer];
    
    [prefs setObject:@"" forKey:@"utakeover-ip"];
    [prefs setObject:@"" forKey:@"utakeover-token"];
    [prefs setObject:@"" forKey:@"utakeover-session"];
    [prefs synchronize];
    
    [txtConnection setTextColor:[NSColor blackColor]];
    [txtConnection setStringValue:@"connecting..."];
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getNewSession) userInfo:nil repeats:NO];
}
-(IBAction)clickQuit:(id)sender
{
    [NSApp terminate:self];
}

-(IBAction)clickThreshold:(id)sender
{
    NSSlider *s = (NSSlider*)sender;
    [prefs setInteger:[s integerValue] forKey:@"utakeover-threshold"];
    [prefs synchronize];
}


-(std::string) TrimString:(std::string) str
{
    size_t startpos = str.find_first_not_of(" \t\n\r");
    size_t endpos = str.find_last_not_of(" \t\n\r");
    
    if(( std::string::npos == startpos ) || ( std::string::npos == endpos))
        str = "";
    else
        str = str.substr( startpos, endpos-startpos+1 );
    return str;
}



@end
