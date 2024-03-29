//
//  AboutScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "AboutScene.h"


@implementation AboutScene

#pragma mark -
#pragma mark Init

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [AboutScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {
        //CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        CCMenuItemSprite* btnBack = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                            selectedSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                                    target:self 
                                                                  selector:@selector(menuBackBtnTouched:)];
        
        
        btnBack.position = CGPointMake( [btnBack contentSize].width, [btnBack contentSize].height);
        
        CCMenu* menu = [CCMenu menuWithItems:btnBack, nil];
        menu.position = CGPointMake(0.0f, 0.0f);
        [self addChild:menu];

        

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
