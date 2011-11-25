//
//  GameScene.h
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameController.h"
#import "GameButton.h"

@class GameController;

@interface GameScene : CCLayer {

    GameController *_gameController;
    
    CCArray *_butArray;
}

@property (nonatomic,retain) CCArray *butArray;

+(id)scene;
- (void) pressButtonHuman;


@end
