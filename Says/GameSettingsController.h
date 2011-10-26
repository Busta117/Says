//
//  GameSettingsController.h
//  Says
//
//  Created by Santiago Bustamante on 10/25/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

#import "GameSettingsModel.h"

@interface GameSettingsController : NSObject

{
    GameSettingsModel *gameSettings;
    
    
}


- (void) canPlayEffects:(BOOL)state;
- (void) canPlayMusic:(BOOL)state;
- (void) setMusicVolume:(float)volume;
- (void) setGameSpeed:(float)speed;

- (BOOL) canPlayEffects;
- (BOOL) canPlayMusic;
- (float) musicVolume;
- (float) gameSpeed;

@end
