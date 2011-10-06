//
//  MenuLayer.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "MenuLayer.h"
#import "GameScene.h"

@interface MenuLayer (privateMethods)
-(void)menuPlayBtnTouched: (id)sender;
-(void)menuHowToBtnTouched: (id)sender;
-(void)menuTopTenBtnTouched: (id)sender;
-(void)menuConfigBtnTouched: (id)sender;
@end


@implementation MenuLayer

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [MenuLayer node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {
        //define margin depending the device. --> must do!!
        margin = 7;
        
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        CCSprite* menuTitle = [CCSprite spriteWithFile:@"saysdoble.png"];
        [self addChild:menuTitle];
        
        CCSprite* btnPlayNormal = [CCSprite spriteWithFile:@"menu_agua.png"];
        CCSprite* btnPlaySelected = [CCSprite spriteWithFile:@"menu_agua_dwn.png"];
        
        CCSprite* btnHowToNormal = [CCSprite spriteWithFile:@"menu_cafe.png"];
        CCSprite* btnHowToSelected = [CCSprite spriteWithFile:@"menu_cafe_dwn.png"];
        
        CCSprite* btnTopTenNormal = [CCSprite spriteWithFile:@"rojo.png"];
        CCSprite* btnTopTenSelected = [CCSprite spriteWithFile:@"rojo_dwn.png"];
        
        CCSprite* btnConfigNormal = [CCSprite spriteWithFile:@"azul.png"];
        CCSprite* btnConfigSelected = [CCSprite spriteWithFile:@"azul_dwn.png"];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        float titleHeight = [menuTitle texture].contentSize.height * 0.5f;
        //float btnPlayHeightHalved = [btnPlayNormal texture].contentSize.height * 0.5f;
        float btnHeightHalved = [btnHowToNormal texture].contentSize.height * 0.5f;
        float btnWidthHalved = [btnHowToNormal texture].contentSize.width * 0.5f;
        
        CCMenuItemSprite* btnPlay = [CCMenuItemSprite itemFromNormalSprite:btnPlayNormal selectedSprite:btnPlaySelected target:self selector:@selector(menuPlayBtnTouched:)];
        btnPlay.position = CGPointMake(winSize.width/2, winSize.height/2.82);
        
        CCLabelTTF *playLbl = [[[CCLabelTTF alloc] initWithString:@"Play" fontName:@"Arial" fontSize:15] autorelease];
        playLbl.position = ccp([btnPlay rect].size.width * 0.5f,[btnPlay rect].size.height * 0.5f);
        playLbl.color = ccc3(255,255,255);
        [btnPlay addChild:playLbl];
        
        
        CCMenuItemSprite* btnHowTo = [CCMenuItemSprite itemFromNormalSprite:btnHowToNormal selectedSprite:btnHowToSelected target:self selector:@selector(menuHowToBtnTouched:)];
        btnHowTo.position = CGPointMake(btnWidthHalved + margin, winSize.height/1.8);
        
        CCLabelTTF *HowToLbl = [[[CCLabelTTF alloc] initWithString:@"How To Play" fontName:@"Arial" fontSize:15] autorelease];
        HowToLbl.position = ccp([btnHowTo rect].size.width * 0.5f,[btnHowTo rect].size.height * 0.5f);
        HowToLbl.color = ccc3(255,255,255);
        [btnHowTo addChild:HowToLbl];
        
        CCMenuItemSprite* btnTopTen = [CCMenuItemSprite itemFromNormalSprite:btnTopTenNormal selectedSprite:btnTopTenSelected target:self selector:@selector(menuTopTenBtnTouched:)];
        btnTopTen.position = CGPointMake(winSize.width - btnWidthHalved - margin, winSize.height/1.6);
        
        CCMenuItemSprite* btnConfig = [CCMenuItemSprite itemFromNormalSprite:btnConfigNormal selectedSprite:btnConfigSelected target:self selector:@selector(menuConfigBtnTouched:)];
        btnConfig.position = CGPointMake(btnWidthHalved + margin, 0);
        
        menuTitle.position = CGPointMake(winSize.width/2, winSize.height - margin*3 - titleHeight/2);
        
        CCMenu* menu = [CCMenu menuWithItems:btnPlay,btnHowTo, btnTopTen, nil];
        menu.position = CGPointMake(0.0f, 0.0f);
        [self addChild:menu];
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

-(void)menuTopTenBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[GameScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)menuConfigBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[GameScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}
-(void)dealloc {
    [super dealloc];
}

@end
