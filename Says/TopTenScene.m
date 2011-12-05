//
//  TopTen.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "TopTenScene.h"
#define FONT_NAME @"Arial"
#define FONT_SIZE 15

@implementation TopTenScene

#pragma mark -
#pragma mark Init

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [TopTenScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {
        CCMenu* menu = [CCMenu menuWithItems:nil];//[CCMenu menuWithItems:btnBack, nil];
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        
        NSMutableArray* topTen = [TopTenManager getTopTenList];
        
        for (int i = 0; i < [topTen count]; i++) {
            
            TopTenEntry* entry = [topTen objectAtIndex:i];
            
            CCLabelTTF *numberLbl = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", i+1] fontName:FONT_NAME fontSize:FONT_SIZE];
            
            CCLabelTTF *nameLbl = [CCLabelTTF labelWithString:[entry name] fontName:FONT_NAME fontSize:FONT_SIZE];
            
            CCLabelTTF *pointsLbl = [CCLabelTTF labelWithString:[NSString stringWithFormat:@"%d", [entry points]] fontName:FONT_NAME fontSize:FONT_SIZE];
            
            numberLbl.anchorPoint = CGPointZero;
            numberLbl.position = CGPointMake(winSize.width*0.13, winSize.height*0.7 - ([numberLbl contentSize].height+4)*(i+1));
            nameLbl.anchorPoint = CGPointZero;
            nameLbl.position = CGPointMake(numberLbl.position.x + 30, numberLbl.position.y);
            pointsLbl.anchorPoint = CGPointZero;
            pointsLbl.position = CGPointMake(winSize.width*0.8, numberLbl.position.y);
            
            [self addChild:numberLbl];
            [self addChild:nameLbl];
            [self addChild:pointsLbl];
            
            
            CCMenuItemSprite* btnBack = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                                selectedSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                                        target:self 
                                                                      selector:@selector(menuBackBtnTouched:)];
            
            btnBack.anchorPoint = CGPointZero;
            
            [menu addChild:btnBack];
            
            menu.anchorPoint = CGPointZero;
            menu.position = CGPointZero;
            
            [self addChild:menu];
        }

    }
    return self;
}

#pragma mark -
#pragma mark UI Events

-(void)menuBackBtnTouched: (id)sender {
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[MenuLayer scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

-(void)dealloc {
    [super dealloc];
}

@end
