//
//  GameController.m
//  Says
//
//  Created by Santiago Bustamante on 11/23/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

#import "GameController.h"

@implementation GameController

@synthesize target;

- (id) initWithTarget:(id)tar
{
    if ((self = [super init])) {
        
        self.target = tar;
        
    }
    return self;
}

#pragma mark Touch Events
- (void) ccTouchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
    NSSet *touchesSet = [event allTouches];
    if (touchesSet.count == 1) 
    {
        
    }
}


- (void) ccTouchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
    
}


- (void) ccTouchesEnded:(NSSet *) touches withEvent:(UIEvent *) event
{
    NSSet *touchesSet = [event allTouches];
    if (touchesSet.count == 1) 
    {
        UITouch *touch = [[touchesSet allObjects] objectAtIndex: 0];
        CGPoint touchLocation = [self convertTouchToNodeSpace:touch];
        
        GameScene * target_ = ((GameScene *)self.target);
        
        for (uint i= 0; i <[target_.butArray count] ; i++) {
            
            GameButton * but = (GameButton *)[target_.butArray objectAtIndex:i];
            
            if (CGRectContainsPoint(but.rect,touchLocation)) {
                NSLog(@"hola");
                [but pressButton];
                break;
            }
            
        }
        
    }
}


@end
