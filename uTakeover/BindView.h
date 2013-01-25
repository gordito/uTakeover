//
//  BindView.h
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-21.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BindView : NSViewController
{
    IBOutlet NSScrollView *svp1, *svp2, *svp3, *svp4;
    IBOutlet NSView *vp1, *vp2, *vp3, *vp4;
}
@property (nonatomic,retain) IBOutlet NSScrollView *svp1, *svp2, *svp3, *svp4;
@property (nonatomic,retain) IBOutlet NSView *vp1, *vp2, *vp3, *vp4;
-(IBAction)clickRight:(id)sender;
-(IBAction)clickLeft:(id)sender;
@end
