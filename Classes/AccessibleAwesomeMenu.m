//
//  AccessibleAwesomeMenu.m
//  eXplora MuSe
//
//  Created by Nicolò Tosi on 7/23/13.
//  Copyright (c) 2013 MobFarm. All rights reserved.
//

#import "AccessibleAwesomeMenu.h"

@implementation AccessibleAwesomeMenu

- (id)initWithFrame:(CGRect)frame menus:(NSArray *)aMenusArray
{
    self = [super initWithFrame:frame menus:aMenusArray];
    {
        // Initialization code
        
        /* This will make the root element of the awesome menù treated like an UIButton with title 'Menu' */
        _addButton.isAccessibilityElement = YES;
        _addButton.accessibilityIdentifier = NSLocalizedString(@"AWESOME_MENU_MENU", @"");
        _addButton.accessibilityTraits = UIAccessibilityTraitButton;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
