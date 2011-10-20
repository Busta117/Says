//
//  Cell.h
//  Says
//
//  Created by Daniel  Gomez Rico on 19/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface Cell : CCMenuItemSprite {
    //Sound Attribute

}

-(Cell*) initWithSound:(NSString*)sound andPress:(NSString*)pressImage andUnpress:(NSString*)unpressImage;

@end
