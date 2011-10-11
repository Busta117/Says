//
//  MenuLayer.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "MenuLayer.h"
#import "GameScene.h"
#import "HowToScene.h"
#import "TopTenScene.h"
#import "ConfigScene.h"
#import "AboutScene.h"

@interface MenuLayer (privateMethods)
-(void)menuPlayBtnTouched: (id)sender;
-(void)menuHowToBtnTouched: (id)sender;
-(void)menuTopTenBtnTouched: (id)sender;
-(void)menuConfigBtnTouched: (id)sender;
-(void)menuAboutBtnTouched: (id)sender;
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
        margin = 10;
        
        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        
        //Creación de Sprites
        
        CCSprite* menuTitle = [CCSprite spriteWithFile:@"saysdoble.png"];
        [self addChild:menuTitle];
        
        CCSprite* btnPlayNormal = [CCSprite spriteWithFile:@"menu_agua.png"];
        CCSprite* btnPlaySelected = [CCSprite spriteWithFile:@"menu_agua_dwn.png"];
        
        CCSprite* btnHowToNormal = [CCSprite spriteWithFile:@"menu_cafe.png"];
        CCSprite* btnHowToSelected = [CCSprite spriteWithFile:@"menu_cafe_dwn.png"];
        
        CCSprite* btnTopTenNormal = [CCSprite spriteWithFile:@"menu_cafe.png"];
        CCSprite* btnTopTenSelected = [CCSprite spriteWithFile:@"menu_cafe_dwn.png"];
        
        CCSprite* btnConfigNormal = [CCSprite spriteWithFile:@"menu_cafe.png"];
        CCSprite* btnConfigSelected = [CCSprite spriteWithFile:@"menu_cafe_dwn.png"];
        
        CCSprite* btnAboutNormal = [CCSprite spriteWithFile:@"menu_cafe.png"];
        CCSprite* btnAboutSelected = [CCSprite spriteWithFile:@"menu_cafe_dwn.png"];
        
        
        //Variables para la ubicación de los botones del menu
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        float titleHeight = [menuTitle texture].contentSize.height * 0.5f;
        float btnHeightHalved = [btnHowToNormal texture].contentSize.height * 0.5f;
        float btnWidthHalved = [btnHowToNormal texture].contentSize.width * 0.5f;
        
        
        //Inicializacion y ubicación de Sprites con sus respectivos lbl
        CCMenuItemSprite* btnPlay = [CCMenuItemSprite itemFromNormalSprite:btnPlayNormal selectedSprite:btnPlaySelected target:self selector:@selector(menuPlayBtnTouched:)];
        btnPlay.position = CGPointMake(winSize.width/2, winSize.height/2.82);
        
        CCLabelTTF *playLbl = [[[CCLabelTTF alloc] initWithString:@"Play" fontName:@"Arial" fontSize:15] autorelease];
        playLbl.position = ccp([btnPlay rect].size.width * 0.5f,[btnPlay rect].size.height * 0.5f);
        playLbl.color = ccc3(255,255,255);
        [btnPlay addChild:playLbl];
        
        
        CCMenuItemSprite* btnHowTo = [CCMenuItemSprite itemFromNormalSprite:btnHowToNormal selectedSprite:btnHowToSelected target:self selector:@selector(menuHowToBtnTouched:)];
        btnHowTo.position = CGPointMake(btnWidthHalved + margin, winSize.height/1.8);
        
        CCLabelTTF *howToLbl = [[[CCLabelTTF alloc] initWithString:@"How To Play" fontName:@"Arial" fontSize:15] autorelease];
        howToLbl.position = ccp([btnHowTo rect].size.width * 0.5f,[btnHowTo rect].size.height * 0.5f);
        howToLbl.color = ccc3(255,255,255);
        [btnHowTo addChild:howToLbl];
        
        
        CCMenuItemSprite* btnTopTen = [CCMenuItemSprite itemFromNormalSprite:btnTopTenNormal selectedSprite:btnTopTenSelected target:self selector:@selector(menuTopTenBtnTouched:)];
        btnTopTen.position = CGPointMake(winSize.width - btnWidthHalved - margin, winSize.height/1.8);
        
        CCLabelTTF* topTenLbl = [[[CCLabelTTF alloc] initWithString:@"Top Ten" fontName:@"Arial" fontSize:15] autorelease];
        topTenLbl.position = CGPointMake([btnTopTen rect].size.width * 0.5f, [btnTopTen rect].size.height * 0.5f);
        topTenLbl.color = ccc3(255, 255, 255);
        [btnTopTen addChild:topTenLbl];
        
        
        CCMenuItemSprite* btnConfig = [CCMenuItemSprite itemFromNormalSprite:btnConfigNormal selectedSprite:btnConfigSelected target:self selector:@selector(menuConfigBtnTouched:)];
        //Hay q organizar la posicion de los botones!!
        btnConfig.position = CGPointMake(btnWidthHalved + margin, btnHeightHalved + margin*3);
        
        CCLabelTTF* configLbl = [[[CCLabelTTF alloc] initWithString:@"Configuration" fontName:@"Arial" fontSize:15] autorelease];
        configLbl.position = CGPointMake([btnConfig rect].size.width * 0.5f, [btnConfig rect].size.height * 0.5f);
        configLbl.color = ccc3(255, 255, 255);
        [btnConfig addChild:configLbl];
        
        
        CCMenuItemSprite* btnAbout = [CCMenuItemSprite itemFromNormalSprite:btnAboutNormal selectedSprite:btnAboutSelected target:self selector:@selector(menuAboutBtnTouched:)];
        btnAbout.position = CGPointMake(winSize.width - btnWidthHalved - margin, btnHeightHalved + margin*3);
        
        CCLabelTTF* aboutLbl = [[[CCLabelTTF alloc] initWithString:@"About" fontName:@"Arial" fontSize:15] autorelease];
        aboutLbl.position = CGPointMake([btnAbout rect].size.width * 0.5f, [btnAbout rect].size.height * 0.5f);
        aboutLbl.color = ccc3(255, 255, 255);
        [btnAbout addChild:aboutLbl];
        
        menuTitle.position = CGPointMake(winSize.width/2, winSize.height - margin*4 - titleHeight/2);
        
        CCMenu* menu = [CCMenu menuWithItems:btnPlay, btnHowTo, btnTopTen, btnConfig, btnAbout, nil];
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
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[HowToScene  scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)menuTopTenBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[TopTenScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)menuConfigBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[ConfigScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)menuAboutBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[AboutScene scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)dealloc {
    [super dealloc];
}

@end
