//
//  GameSettingsModel.h
//  Says
//
//  Created by Santiago Bustamante on 10/25/11.
//  Copyright (c) 2011 Demens. All rights reserved.
//

@interface GameSettingsModel : NSObject


+ (void) setInteger:(int)value forKey:(NSString *)key;
+ (void) setString:(NSString *)value forKey:(NSString *)key;
+ (void) setFloat:(float)value forKey:(NSString *)key;
+ (void) setEffectsState:(BOOL)state;
+ (void) setMusicState:(BOOL)state;
+ (void) setMusicVolume:(float)volume;
+ (void) setGameSpeed:(float)speed;

+ (int) getIntegerForKey:(NSString *)key;
+ (NSString *) getString:(NSString *)value forKey:(NSString *)key;
+ (float) getFloatForKey:(NSString *)key;
+ (BOOL) getEffectsState;
+ (BOOL) getMusicState;
+ (float) getMusicVolume;
+ (float) getGameSpeed;

@end
