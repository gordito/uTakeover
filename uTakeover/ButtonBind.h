//
//  ButtonBind.h
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-24.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import <Foundation/Foundation.h>
#include <Carbon/Carbon.h>

@interface ButtonBind : NSView
{
    NSUserDefaults *prefs;
    NSString *lbl;
    NSTextField *txtLabel;
}
- (id)initWithLabel:(NSString*)label;
-(NSString*) getLabel:(CGKeyCode)key;
-(void)addBtn:(id)sender;
@end
