//
//  BindView.m
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import "BindView.h"
#import "ButtonBind.h"

@interface BindView ()

@end

@implementation BindView
@synthesize svp1,svp2,svp3,svp4,vp1,vp2,vp3,vp4;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSImageView *imgPlayer = [[NSImageView alloc] initWithFrame:NSMakeRect(0, 120, 1080, 33)];
        imgPlayer.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"player-select" ofType:@"png"]];
        [self.view addSubview:imgPlayer positioned:NSWindowBelow relativeTo:nil];
        
        NSImageView *line1 = [[NSImageView alloc] initWithFrame:NSMakeRect(70, 0, 2, 120)];
        line1.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"line-small" ofType:@"png"]];
        [line1 setAlphaValue:0.3f];
        [self.view addSubview:line1 positioned:NSWindowAbove relativeTo:nil];
        
        NSImageView *line2 = [[NSImageView alloc] initWithFrame:NSMakeRect(70+270, 0, 2, 120)];
        line2.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"line-small" ofType:@"png"]];
        [line2 setAlphaValue:0.3f];
        [self.view addSubview:line2 positioned:NSWindowAbove relativeTo:nil];
        
        NSImageView *line3 = [[NSImageView alloc] initWithFrame:NSMakeRect(70+270*2, 0, 2, 120)];
        line3.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"line-small" ofType:@"png"]];
        [line3 setAlphaValue:0.3f];
        [self.view addSubview:line3 positioned:NSWindowAbove relativeTo:nil];
        
        NSImageView *line4 = [[NSImageView alloc] initWithFrame:NSMakeRect(70+270*3, 0, 2, 120)];
        line4.image = [[NSImage alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"line-small" ofType:@"png"]];
        [line4 setAlphaValue:0.3f];
        [self.view addSubview:line4 positioned:NSWindowAbove relativeTo:nil];
        
        
        [svp1 setDrawsBackground:NO];
        [svp1 setBorderType:NSNoBorder];
        [svp1 setHasVerticalScroller:YES];
        [svp1 setHasHorizontalScroller:NO];
        [svp1 setDocumentView:vp1];
        [[svp1 documentView] scrollPoint:NSMakePoint(0, vp1.frame.size.height)];
        
        [svp2 setDrawsBackground:NO];
        [svp2 setBorderType:NSNoBorder];
        [svp2 setHasVerticalScroller:YES];
        [svp2 setHasHorizontalScroller:NO];
        [svp2 setDocumentView:vp2];
        [[svp2 documentView] scrollPoint:NSMakePoint(0, vp2.frame.size.height)];
        
        [svp3 setDrawsBackground:NO];
        [svp3 setBorderType:NSNoBorder];
        [svp3 setHasVerticalScroller:YES];
        [svp3 setHasHorizontalScroller:NO];
        [svp3 setDocumentView:vp3];
        [[svp3 documentView] scrollPoint:NSMakePoint(0, vp3.frame.size.height)];
        
        [svp4 setDrawsBackground:NO];
        [svp4 setBorderType:NSNoBorder];
        [svp4 setHasVerticalScroller:YES];
        [svp4 setHasHorizontalScroller:NO];
        [svp4 setDocumentView:vp4];
        [[svp4 documentView] scrollPoint:NSMakePoint(0, vp4.frame.size.height)];
        
        
        ButtonBind *btnUpP1 = [[ButtonBind alloc] initWithLabel:@"utakeover-up-p1"];
        [btnUpP1 setFrameOrigin:NSMakePoint(90, 145)];
        [vp1 addSubview:btnUpP1];
        ButtonBind *btnDownP1 = [[ButtonBind alloc] initWithLabel:@"utakeover-down-p1"];
        [btnDownP1 setFrameOrigin:NSMakePoint(90, 120)];
        [vp1 addSubview:btnDownP1];
        ButtonBind *btnLeftP1 = [[ButtonBind alloc] initWithLabel:@"utakeover-left-p1"];
        [btnLeftP1 setFrameOrigin:NSMakePoint(90, 95)];
        [vp1 addSubview:btnLeftP1];
        ButtonBind *btnRightP1 = [[ButtonBind alloc] initWithLabel:@"utakeover-right-p1"];
        [btnRightP1 setFrameOrigin:NSMakePoint(90, 70)];
        [vp1 addSubview:btnRightP1];
        ButtonBind *btnBtn1P1 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn1-p1"];
        [btnBtn1P1 setFrameOrigin:NSMakePoint(90, 45)];
        [vp1 addSubview:btnBtn1P1];
        ButtonBind *btnBtn2P1 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn2-p1"];
        [btnBtn2P1 setFrameOrigin:NSMakePoint(90, 20)];
        [vp1 addSubview:btnBtn2P1];
        
        
        
        ButtonBind *btnUpP2 = [[ButtonBind alloc] initWithLabel:@"utakeover-up-p2"];
        [btnUpP2 setFrameOrigin:NSMakePoint(90, 145)];
        [vp2 addSubview:btnUpP2];
        ButtonBind *btnDownP2 = [[ButtonBind alloc] initWithLabel:@"utakeover-down-p2"];
        [btnDownP2 setFrameOrigin:NSMakePoint(90, 120)];
        [vp2 addSubview:btnDownP2];
        ButtonBind *btnLeftP2 = [[ButtonBind alloc] initWithLabel:@"utakeover-left-p2"];
        [btnLeftP2 setFrameOrigin:NSMakePoint(90, 95)];
        [vp2 addSubview:btnLeftP2];
        ButtonBind *btnRightP2 = [[ButtonBind alloc] initWithLabel:@"utakeover-right-p2"];
        [btnRightP2 setFrameOrigin:NSMakePoint(90, 70)];
        [vp2 addSubview:btnRightP2];
        ButtonBind *btnBtn1P2 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn1-p2"];
        [btnBtn1P2 setFrameOrigin:NSMakePoint(90, 45)];
        [vp2 addSubview:btnBtn1P2];
        ButtonBind *btnBtn2P2 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn2-p2"];
        [btnBtn2P2 setFrameOrigin:NSMakePoint(90, 20)];
        [vp2 addSubview:btnBtn2P2];
        
        ButtonBind *btnUpP3 = [[ButtonBind alloc] initWithLabel:@"utakeover-up-p3"];
        [btnUpP3 setFrameOrigin:NSMakePoint(90, 145)];
        [vp3 addSubview:btnUpP3];
        ButtonBind *btnDownP3 = [[ButtonBind alloc] initWithLabel:@"utakeover-down-p3"];
        [btnDownP3 setFrameOrigin:NSMakePoint(90, 120)];
        [vp3 addSubview:btnDownP3];
        ButtonBind *btnLeftP3 = [[ButtonBind alloc] initWithLabel:@"utakeover-left-p3"];
        [btnLeftP3 setFrameOrigin:NSMakePoint(90, 95)];
        [vp3 addSubview:btnLeftP3];
        ButtonBind *btnRightP3 = [[ButtonBind alloc] initWithLabel:@"utakeover-right-p3"];
        [btnRightP3 setFrameOrigin:NSMakePoint(90, 70)];
        [vp3 addSubview:btnRightP3];
        ButtonBind *btnBtn1P3 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn1-p3"];
        [btnBtn1P3 setFrameOrigin:NSMakePoint(90, 45)];
        [vp3 addSubview:btnBtn1P3];
        ButtonBind *btnBtn2P3 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn2-p3"];
        [btnBtn2P3 setFrameOrigin:NSMakePoint(90, 20)];
        [vp3 addSubview:btnBtn2P3];
        
        ButtonBind *btnUpP4 = [[ButtonBind alloc] initWithLabel:@"utakeover-up-p4"];
        [btnUpP4 setFrameOrigin:NSMakePoint(90, 145)];
        [vp4 addSubview:btnUpP4];
        ButtonBind *btnDownP4 = [[ButtonBind alloc] initWithLabel:@"utakeover-down-p4"];
        [btnDownP4 setFrameOrigin:NSMakePoint(90, 120)];
        [vp4 addSubview:btnDownP4];
        ButtonBind *btnLeftP4 = [[ButtonBind alloc] initWithLabel:@"utakeover-left-p4"];
        [btnLeftP4 setFrameOrigin:NSMakePoint(90, 95)];
        [vp4 addSubview:btnLeftP4];
        ButtonBind *btnRightP4 = [[ButtonBind alloc] initWithLabel:@"utakeover-right-p4"];
        [btnRightP4 setFrameOrigin:NSMakePoint(90, 70)];
        [vp4 addSubview:btnRightP4];
        ButtonBind *btnBtn1P4 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn1-p4"];
        [btnBtn1P4 setFrameOrigin:NSMakePoint(90, 45)];
        [vp4 addSubview:btnBtn1P4];
        ButtonBind *btnBtn2P4 = [[ButtonBind alloc] initWithLabel:@"utakeover-btn2-p4"];
        [btnBtn2P4 setFrameOrigin:NSMakePoint(90, 20)];
        [vp4 addSubview:btnBtn2P4];
        
    }
    
    return self;
}
-(IBAction)clickRight:(id)sender
{
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.3f];
    [[self.view animator] setFrame:NSMakeRect(self.view.frame.origin.x-270, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [NSAnimationContext endGrouping];
}
-(IBAction)clickLeft:(id)sender
{
    [NSAnimationContext beginGrouping];
    [[NSAnimationContext currentContext] setDuration:0.3f];
    [[self.view animator] setFrame:NSMakeRect(self.view.frame.origin.x+270, self.view.frame.origin.y, self.view.frame.size.width, self.view.frame.size.height)];
    [NSAnimationContext endGrouping];
}

@end
