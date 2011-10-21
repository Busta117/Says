//
//  GameScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "GameScene.h"

@implementation GameScene

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [GameScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {  
        
    }
    
    return self;
}

-(void)dealloc {
//    [table dealloc];
    [super dealloc];
}

@end
