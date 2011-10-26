//
//  MenuLayer.h
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/3/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "GameScene.h"
#import "HowToScene.h"
#import "TopTenScene.h"
#import "ConfigScene.h"
#import "AboutScene.h"
#import "TopTenManager.h"
#import "GameSettingsModel.h"


@interface MenuLayer : CCLayer {
    float margin;
}

+(id)scene;

@end
