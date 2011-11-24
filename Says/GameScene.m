//
//  GameScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "GameScene.h"

#define NUM_BUTS 9;

@implementation GameScene

@synthesize butArray=_butArray;


+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [GameScene node];
    [scene addChild:layer];
    return scene;
}

#pragma mark initializer
-(id)init {
    if ((self = [super init])) {  
        
        //activa para recibir toques
        self.isTouchEnabled = YES;
        
        self.butArray = [CCArray arrayWithCapacity:8];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        CGPoint positionBut = CGPointZero;
        
        float deltaY =  80;
        int row = 0;
        int numButs = NUM_BUTS;
        for (int i=0; i<numButs; i++) {
            positionBut = CGPointMake(winSize.width*((i%3)+1)/4, winSize.height*0.8 - (deltaY*(row)) );
            GameButton *but = [GameButton buttonWithTag:i andPosition:positionBut];
            [self.butArray addObject:but];
            [self addChild:but.currentSprite z:1];
            if (i == 2 ||i == 5) {
                row++;
            }
        }
        
        _gameController = [[GameController alloc] initWithTarget:self];
        
    }
    
    return self;
}


#pragma mark Touch Events
- (void) ccTouchesBegan:(NSSet *) touches withEvent:(UIEvent *) event
{
    [_gameController ccTouchesBegan:touches withEvent:event];
}


- (void) ccTouchesMoved:(NSSet *) touches withEvent:(UIEvent *) event
{
    [_gameController ccTouchesMoved:touches withEvent:event];    
}


- (void) ccTouchesEnded:(NSSet *) touches withEvent:(UIEvent *) event
{
    [_gameController ccTouchesEnded:touches withEvent:event];
}


#pragma mark memory management
-(void)dealloc {
    [_gameController release];
    [super dealloc];
}

@end
