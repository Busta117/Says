//
//  GameScene.h
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Table.h"

@interface GameScene : CCLayer {
    Table* table;
}

+(id)scene;

@end
