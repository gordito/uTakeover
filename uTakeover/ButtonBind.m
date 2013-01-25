//
//  ButtonBind.m
//  uTakeover
//
//  Created by Robin Kochauf on 2013-01-24.
//  Copyright (c) 2013 Gordito AB. All rights reserved.
//

#import "ButtonBind.h"

@implementation ButtonBind
- (id)initWithLabel:(NSString*)label
{
    self = [super initWithFrame:NSMakeRect(0, 0, 170, 17)];
    if (self) {
        
        prefs = [NSUserDefaults standardUserDefaults];
        lbl = [[NSString alloc] initWithString:label];
        NSInteger key = [prefs integerForKey:label];
        NSString *txt = [self getLabel:key];
        
        txtLabel = [[NSTextField alloc] initWithFrame:NSMakeRect(0, 0, 170, 17)];
        [txtLabel setStringValue:txt];
        [[txtLabel cell] setLineBreakMode:NSLineBreakByClipping];
        [txtLabel setBezeled:NO];
        [txtLabel setDrawsBackground:NO];
        [txtLabel setEditable:NO];
        [txtLabel setSelectable:NO];
        [txtLabel setAlignment:NSLeftTextAlignment];
        [self addSubview:txtLabel];
    }
    
    return self;
}
- (void)mouseDown:(NSEvent *)theEvent
{
    NSMenu *menu = [[NSMenu alloc] initWithTitle:@"KeyList"];
    [menu addItemWithTitle:[self getLabel:kVK_UpArrow] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_DownArrow] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_LeftArrow] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_RightArrow] action:@selector(addBtn:) keyEquivalent:@""];
    
    [menu addItemWithTitle:[self getLabel:kVK_Return] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Tab] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Space] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Delete] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ForwardDelete] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Home] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_End] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_PageUp] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_PageDown] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Shift] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_RightShift] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Command] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Control] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_RightControl] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_Option] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_RightOption] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_CapsLock] action:@selector(addBtn:) keyEquivalent:@""];
    
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_0] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_1] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_2] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_3] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_4] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_5] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_6] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_7] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_8] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_9] action:@selector(addBtn:) keyEquivalent:@""];
    
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_A] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_B] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_C] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_D] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_E] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_F] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_G] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_H] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_I] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_J] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_K] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_L] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_M] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_N] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_O] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_P] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_Q] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_R] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_S] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_T] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_U] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_V] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_W] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_X] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_Y] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_ANSI_Z] action:@selector(addBtn:) keyEquivalent:@""];
    
    [menu addItemWithTitle:[self getLabel:kVK_F1] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F2] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F3] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F4] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F5] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F6] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F7] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F8] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F9] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F10] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F11] action:@selector(addBtn:) keyEquivalent:@""];
    [menu addItemWithTitle:[self getLabel:kVK_F12] action:@selector(addBtn:) keyEquivalent:@""];
    
    [NSMenu popUpContextMenu:menu withEvent:theEvent forView:self];
    
}

-(void)addBtn:(id)sender
{
    [txtLabel setStringValue:[sender title]];
    [prefs setInteger:[self getKey:[sender title]] forKey:lbl];
    [prefs synchronize];
}

-(NSString*) getLabel:(CGKeyCode)key
{
    switch (key) {
        case kVK_UpArrow:
            return @"UP ARROW";
        case kVK_DownArrow:
            return @"DOWN ARROW";
        case kVK_LeftArrow:
            return @"LEFT ARROW";
        case kVK_RightArrow:
            return @"RIGHT ARROW";
        case kVK_Return:
            return @"RETURN";
        case kVK_Tab:
            return @"TAB";
        case kVK_Space:
            return @"SPACE";
        case kVK_Delete:
            return @"BACKSPACE";
        case kVK_ForwardDelete:
            return @"DELETE";
        case kVK_Home:
            return @"HOME";
        case kVK_End:
            return @"END";
        case kVK_PageUp:
            return @"PAGE UP";
        case kVK_PageDown:
            return @"PAGE DOWN";
        case kVK_Shift:
            return @"LEFT SHIFT";
        case kVK_RightShift:
            return @"RIGHT SHIFT";
        case kVK_Command:
            return @"COMMAND";
        case kVK_Control:
            return @"LEFT CTRL";
        case kVK_RightControl:
            return @"RIGHT CTRL";
        case kVK_Option:
            return @"LEFT ALT";
        case kVK_RightOption:
            return @"RIGHT ALT";
        case kVK_CapsLock:
            return @"CAPS LOCK";
            
        case kVK_ANSI_0:
            return @"0";
        case kVK_ANSI_1:
            return @"1";
        case kVK_ANSI_2:
            return @"2";
        case kVK_ANSI_3:
            return @"3";
        case kVK_ANSI_4:
            return @"4";
        case kVK_ANSI_5:
            return @"5";
        case kVK_ANSI_6:
            return @"6";
        case kVK_ANSI_7:
            return @"7";
        case kVK_ANSI_8:
            return @"8";
        case kVK_ANSI_9:
            return @"9";
        
        case kVK_ANSI_A:
            return @"A";
        case kVK_ANSI_B:
            return @"B";
        case kVK_ANSI_C:
            return @"C";
        case kVK_ANSI_D:
            return @"D";
        case kVK_ANSI_E:
            return @"E";
        case kVK_ANSI_F:
            return @"F";
        case kVK_ANSI_G:
            return @"G";
        case kVK_ANSI_H:
            return @"H";
        case kVK_ANSI_I:
            return @"I";
        case kVK_ANSI_J:
            return @"J";
        case kVK_ANSI_K:
            return @"K";
        case kVK_ANSI_L:
            return @"L";
        case kVK_ANSI_M:
            return @"M";
        case kVK_ANSI_N:
            return @"N";
        case kVK_ANSI_O:
            return @"O";
        case kVK_ANSI_P:
            return @"P";
        case kVK_ANSI_Q:
            return @"Q";
        case kVK_ANSI_R:
            return @"R";
        case kVK_ANSI_S:
            return @"S";
        case kVK_ANSI_T:
            return @"T";
        case kVK_ANSI_U:
            return @"U";
        case kVK_ANSI_V:
            return @"V";
        case kVK_ANSI_W:
            return @"W";
        case kVK_ANSI_X:
            return @"X";
        case kVK_ANSI_Y:
            return @"Y";
        case kVK_ANSI_Z:
            return @"Z";
        
        case kVK_F1:
            return @"F1";
        case kVK_F2:
            return @"F2";
        case kVK_F3:
            return @"F3";
        case kVK_F4:
            return @"F4";
        case kVK_F5:
            return @"F5";
        case kVK_F6:
            return @"F6";
        case kVK_F7:
            return @"F7";
        case kVK_F8:
            return @"F8";
        case kVK_F9:
            return @"F9";
        case kVK_F10:
            return @"F10";
        case kVK_F11:
            return @"F11";
        case kVK_F12:
            return @"F12";
            
        default:
            return @"PLEASE SELECT ONE";
    }
}
-(CGKeyCode) getKey:(NSString*)key
{
    if([key isEqualToString:@"UP ARROW"])
        return kVK_UpArrow;
    else if([key isEqualToString:@"DOWN ARROW"])
        return kVK_DownArrow;
    else if([key isEqualToString:@"LEFT ARROW"])
        return kVK_LeftArrow;
    else if([key isEqualToString:@"RIGHT ARROW"])
        return kVK_RightArrow;
    else if([key isEqualToString:@"RETURN"])
        return kVK_Return;
    else if([key isEqualToString:@"TAB"])
        return kVK_Tab;
    else if([key isEqualToString:@"SPACE"])
        return kVK_Space;
    else if([key isEqualToString:@"BACKSPACE"])
        return kVK_Delete;
    else if([key isEqualToString:@"DELETE"])
        return kVK_ForwardDelete;
    else if([key isEqualToString:@"HOME"])
        return kVK_Home;
    else if([key isEqualToString:@"END"])
        return kVK_End;
    else if([key isEqualToString:@"PAGE UP"])
        return kVK_PageUp;
    else if([key isEqualToString:@"PAGE DOWN"])
        return kVK_PageDown;
    else if([key isEqualToString:@"LEFT SHIFT"])
        return kVK_Shift;
    else if([key isEqualToString:@"RIGHT SHIFT"])
        return kVK_RightShift;
    else if([key isEqualToString:@"COMMAND"])
        return kVK_Command;
    else if([key isEqualToString:@"LEFT CTRL"])
        return kVK_Control;
    else if([key isEqualToString:@"RIGHT CTRL"])
        return kVK_RightControl;
    else if([key isEqualToString:@"LEFT ALT"])
        return kVK_Option;
    else if([key isEqualToString:@"RIGHT ALT"])
        return kVK_RightOption;
    else if([key isEqualToString:@"CAPS LOCK"])
        return kVK_CapsLock;
    
    else if([key isEqualToString:@"0"])
        return kVK_ANSI_0;
    else if([key isEqualToString:@"1"])
        return kVK_ANSI_1;
    else if([key isEqualToString:@"2"])
        return kVK_ANSI_2;
    else if([key isEqualToString:@"3"])
        return kVK_ANSI_3;
    else if([key isEqualToString:@"4"])
        return kVK_ANSI_4;
    else if([key isEqualToString:@"5"])
        return kVK_ANSI_5;
    else if([key isEqualToString:@"6"])
        return kVK_ANSI_6;
    else if([key isEqualToString:@"7"])
        return kVK_ANSI_7;
    else if([key isEqualToString:@"8"])
        return kVK_ANSI_8;
    else if([key isEqualToString:@"9"])
        return kVK_ANSI_9;
    
    else if([key isEqualToString:@"A"])
        return kVK_ANSI_A;
    else if([key isEqualToString:@"B"])
        return kVK_ANSI_B;
    else if([key isEqualToString:@"C"])
        return kVK_ANSI_C;
    else if([key isEqualToString:@"D"])
        return kVK_ANSI_D;
    else if([key isEqualToString:@"E"])
        return kVK_ANSI_E;
    else if([key isEqualToString:@"F"])
        return kVK_ANSI_F;
    else if([key isEqualToString:@"G"])
        return kVK_ANSI_G;
    else if([key isEqualToString:@"H"])
        return kVK_ANSI_H;
    else if([key isEqualToString:@"I"])
        return kVK_ANSI_I;
    else if([key isEqualToString:@"J"])
        return kVK_ANSI_J;
    else if([key isEqualToString:@"K"])
        return kVK_ANSI_K;
    else if([key isEqualToString:@"L"])
        return kVK_ANSI_L;
    else if([key isEqualToString:@"M"])
        return kVK_ANSI_M;
    else if([key isEqualToString:@"N"])
        return kVK_ANSI_N;
    else if([key isEqualToString:@"O"])
        return kVK_ANSI_O;
    else if([key isEqualToString:@"P"])
        return kVK_ANSI_P;
    else if([key isEqualToString:@"Q"])
        return kVK_ANSI_Q;
    else if([key isEqualToString:@"R"])
        return kVK_ANSI_R;
    else if([key isEqualToString:@"S"])
        return kVK_ANSI_S;
    else if([key isEqualToString:@"T"])
        return kVK_ANSI_T;
    else if([key isEqualToString:@"U"])
        return kVK_ANSI_U;
    else if([key isEqualToString:@"V"])
        return kVK_ANSI_V;
    else if([key isEqualToString:@"W"])
        return kVK_ANSI_W;
    else if([key isEqualToString:@"X"])
        return kVK_ANSI_X;
    else if([key isEqualToString:@"Y"])
        return kVK_ANSI_Y;
    else if([key isEqualToString:@"Z"])
        return kVK_ANSI_Z;
    
    else if([key isEqualToString:@"F1"])
        return kVK_F1;
    else if([key isEqualToString:@"F2"])
        return kVK_F2;
    else if([key isEqualToString:@"F3"])
        return kVK_F3;
    else if([key isEqualToString:@"F4"])
        return kVK_F4;
    else if([key isEqualToString:@"F5"])
        return kVK_F5;
    else if([key isEqualToString:@"F6"])
        return kVK_F6;
    else if([key isEqualToString:@"F7"])
        return kVK_F7;
    else if([key isEqualToString:@"F8"])
        return kVK_F8;
    else if([key isEqualToString:@"F9"])
        return kVK_F9;
    else if([key isEqualToString:@"F10"])
        return kVK_F10;
    else if([key isEqualToString:@"F11"])
        return kVK_F11;
    else if([key isEqualToString:@"F12"])
        return kVK_F12;
    
    else
        return 0;
}

@end
