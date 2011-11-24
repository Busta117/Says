//
//  GameButton.h
//  Says
//
//  Created by Santiago Bustamante on 11/23/11.
//  Copyright 2011 Demens. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GameButton : CCNode {
    
    CCSprite *_currentSprite;
    CGPoint _position;
    int _tag;
    BOOL _pressed;
    CGRect _rect;
    
}

@property (nonatomic, retain) CCSprite *currentSprite;
@property (nonatomic, assign) CGPoint position;
@property (nonatomic, assign) int tag;
@property (nonatomic, assign) BOOL pressed;
@property (nonatomic, assign) CGRect rect;

+ (id) buttonWithTag:(int)tagBut andPosition:(CGPoint) pos;
- (id) initWithTag:(int)tagBut andPosition:(CGPoint) pos;
- (void) pressButton;
- (void) changeSprite;
- (void) playEffect;

@end
