//
//  GameScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "GameScene.h"

//Prueba commit de daniel (no le paren bolas, solo es este comentario)
@implementation GameScene

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [GameScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
    }
    return self;
}

-(void)dealloc {
    [super dealloc];
}

@end
