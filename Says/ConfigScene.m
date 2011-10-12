//
//  ConfigScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "ConfigScene.h"


@implementation ConfigScene

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [ConfigScene node];
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