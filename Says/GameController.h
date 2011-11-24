//
//  GameController.h
//  Says
//
//  Created by Santiago Bustamante on 11/23/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameScene.h"
#import "GameButton.h"

@interface GameController : CCNode
{
    
}

@property (nonatomic,retain)id target;


- (id) initWithTarget:(id)tar;
- (void) ccTouchesBegan:(NSSet *) touches withEvent:(UIEvent *) event;
- (void) ccTouchesMoved:(NSSet *) touches withEvent:(UIEvent *) event;
- (void) ccTouchesEnded:(NSSet *) touches withEvent:(UIEvent *) event;


@end

