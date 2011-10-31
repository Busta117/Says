//
//  ConfigScene.h
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuLayer.h"
#import "GameSettingsController.h"
#import "CDAudioManager.h"

@interface ConfigScene : CCLayer {
    
    CCMenuItemToggle *_configItemMusic;
    CCMenuItemToggle *_configItemFx;
    UISlider *volumeControl;
    
    GameSettingsController *_gameSettingsController;
    
}

@property (nonatomic,retain) GameSettingsController * gameSettingsController;

+(id)scene;

- (void) toggleEffectsOnOff;
- (void) toggleMusicOnOff;

@end
