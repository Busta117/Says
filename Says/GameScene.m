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
        
        //Calculation of position of each cell
        NSArray* cells = [table cells];
        
        int y = 200 , x = 0; //[[CCDirector sharedDirector] winSize].height,
        
        //TO-DO: esta joda tiene un error en el ******* cuando intenta insertar luego de haberse hecho 0 la x
        for (int i = 0; i < [cells count]; i++) {
            
            Cell* cell = [cells objectAtIndex:x];
            
            int newX =  [cell contentSize].width * x;
            int newY =  y - [cell contentSize].height;
            cell.position = CGPointMake(newX,newY);
            
            x++;
            
            if(x == 3){
                y = cell.position.y - [cell contentSize].height;
                x = 0;
            }
            
            [menu addChild:cell];//****************
        }
        
        menu.position = CGPointMake(0.0f, 0.0f);
        [self addChild:menu];
    }
    
    return self;
}

-(void)dealloc {
    [table dealloc];
    [super dealloc];
}

@end
