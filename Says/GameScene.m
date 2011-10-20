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
        
        table = [[Table alloc] init];
        
        //Menu initialization
        CCMenu* menu = [CCMenu menuWithItems: nil];
        menu.position = CGPointMake([[CCDirector sharedDirector] winSize].width/2, [[CCDirector sharedDirector] winSize].height/2);

        //Calculation of position for each cell
        NSArray* cells = [table cells];
        
        for (Cell* cell in cells) {
            [menu addChild:cell];
            
            CCJumpBy *action = [CCJumpBy actionWithDuration:1 position:ccp([[CCDirector sharedDirector] winSize].width / 3, [[CCDirector sharedDirector] winSize].height/ 3) height:25 jumps:2];
            
            [cell runAction:[CCSequence actions:action, [action reverse], nil]];
            
            //[cell runAction:[CCRotateBy actionWithDuration:1 angle:360]];
        }
        
        //TO-DO: cambiarlo, debe ser dinamico segun el numero de celdas que tenga cells
        [menu alignItemsInColumns:[NSNumber numberWithUnsignedInt:3],
         [NSNumber numberWithUnsignedInt:3],
         [NSNumber numberWithUnsignedInt:1],nil];
        
        [self addChild:menu];
    }
    
    return self;
}

-(void)dealloc {
//    [table dealloc];
    [super dealloc];
}

@end
