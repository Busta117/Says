//
//  Cell.m
//  Says
//
//  Created by Daniel  Gomez Rico on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"


@implementation Cell

#pragma mark -
#pragma mark Init

-(Cell*) initWithSound:(NSString*)sound andPress:(NSString*)pressImage andUnpress:(NSString*)unpressImage
{    
    self = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:pressImage]
                                   selectedSprite:[CCSprite spriteWithFile:unpressImage] 
                                           target:self 
                                         selector:@selector(touched:)];
    //Init sound
    
    return self;
}


#pragma mark -
#pragma mark UI Events

-(void)touched: (id)sender {
    //Play sound
}

#pragma mark -
#pragma mark Release

-(void)dealloc {
    [super dealloc];
}

@end

