//
//  GameSettingsController.m
//  Says
//
//  Created by Santiago Bustamante on 10/25/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

#import "GameSettingsController.h"

@implementation GameSettingsController

- (id) init {
    
    if ((self = [super init])) {
        
    }
    return [self autorelease];
}

#pragma mark sets
//setea segun el valor si puede o no reproducir los efectos
- (void) canPlayEffects:(BOOL)state
{
    [GameSettingsModel setEffectsState:state];
}


- (void) canPlayMusic:(BOOL)state
{
    [GameSettingsModel setMusicState:state];
}


- (void) setMusicVolume:(float)volume
{
    [GameSettingsModel setMusicVolume:volume];
}


- (void) setGameSpeed:(float)speed
{
    [GameSettingsModel setGameSpeed:speed];
    
}
#pragma mark -


#pragma mark gets

- (BOOL) canPlayEffects
{
    return [GameSettingsModel getEffectsState];
}

- (BOOL) canPlayMusic
{
    return [GameSettingsModel getMusicState];
}

- (float) musicVolume
{
    return [GameSettingsModel getMusicVolume];
}

- (float) gameSpeed
{
    return [GameSettingsModel getGameSpeed];
}

#pragma mark -


@end
