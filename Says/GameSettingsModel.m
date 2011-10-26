//
//  GameSettingsModel.m
//  Says
//
//  Created by Santiago Bustamante on 10/25/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

#import "GameSettingsModel.h"

@implementation GameSettingsModel

#pragma mark sets
+ (void) setInteger:(int)value forKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setInteger:value forKey:key];    
    [prefs synchronize];
}

+ (void) setString:(NSString *)value forKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:value forKey:key];
    [prefs synchronize];
}

+ (void) setFloat:(float)value forKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setFloat:value forKey:key];
    [prefs synchronize];
}


+ (void) setEffectsState:(BOOL)state
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:state forKey:@"EffectsState"];
    [prefs synchronize];
}

+ (void) setMusicState:(BOOL)state
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setBool:state forKey:@"MusicState"];
    [prefs synchronize];
}

+ (void) setMusicVolume:(float)volume
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setFloat:volume forKey:@"MusicVolume"];
    [prefs synchronize];
}

+ (void) setGameSpeed:(float)speed
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setFloat:speed forKey:@"GameSpeed"];
    [prefs synchronize];
}


#pragma mark -

#pragma mark gets

+ (int) getIntegerForKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return  [((NSNumber *)[prefs integerForKey:key]) intValue];
}

+ (NSString *) getString:(NSString *)value forKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return  [prefs stringForKey:key];
}

+ (float) getFloatForKey:(NSString *)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return  [prefs floatForKey:key];
}


+ (BOOL) getEffectsState
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs boolForKey:@"EffectsState"];
}

+ (BOOL) getMusicState
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs boolForKey:@"MusicState"];
}

+ (float) getMusicVolume
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs floatForKey:@"MusicVolume"];
}

+ (float) getGameSpeed
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    return [prefs floatForKey:@"GameSpeed"];
}


#pragma mark -


@end
