//
//  MenuLayer.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "MenuLayer.h"
#import "GameScene.h"


@implementation MenuLayer

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [MenuLayer node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        CCSprite* menuTitle = [CCSprite spriteWithFile:@"saysdoble.png"];
        [self addChild:menuTitle z:0 tag:1];
        
        CCSprite* btnPlayNormal = [CCSprite spriteWithFile:@"playBut.png"];
        CCSprite* btnPlaySelected = [CCSprite spriteWithFile:@"playBut1.png"];
        
        CCSprite* btnHowToNormal = [CCSprite spriteWithFile:@"cafe.png"];
        CCSprite* btnHowToSelected = [CCSprite spriteWithFile:@"cafe_dwn.png"];

        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        float titleHeight = [menuTitle texture].contentSize.height * 0.5f;
        float btnPlayHeightHalved = [btnPlayNormal texture].contentSize.height * 0.5f;
        float btnHowToHeightHalved = [btnHowToNormal texture].contentSize.height * 0.5f;
        float btnHowToWidthHalved = [btnHowToNormal texture].contentSize.width * 0.5f;
        
        CCMenuItemSprite* btnHowTo = [CCMenuItemSprite itemFromNormalSprite:btnHowToNormal selectedSprite:btnHowToSelected target:self selector:@selector(menuHowToBtnTouched:)];
        btnHowTo.position = CGPointMake(btnHowToWidthHalved, winSize.height - (titleHeight + btnHowToHeightHalved)); 
        
        CCMenuItemSprite* btnPlay = [CCMenuItemSprite itemFromNormalSprite:btnPlayNormal selectedSprite:btnPlaySelected target:self selector:@selector(menuPlayBtnTouched:)];
        btnPlay.position = CGPointMake(winSize.width/2, winSize.height/2 - btnPlayHeightHalved);
        
        menuTitle.position = CGPointMake(winSize.width/2, winSize.height - titleHeight/2);
        
        
        CCMenu* menu = [CCMenu menuWithItems:btnPlay, btnHowTo, nil];
        [self addChild:menu z:0 tag:2];
    }
    return self;
}

-(void)menuPlayBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[GameScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)menuHowToBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[GameScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)dealloc {
    [super dealloc];
}

@end
