//
//  PlistManager.h
//  Says
//
//  Created by Daniel  Gomez Rico on 13/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

//This class show methods do manage Plist
@interface PlistHelper : NSObject

//Returns a NSMutableDictionary that |plistFile| contains
+(NSMutableArray*) getPlistData:(NSString*)plistFile;

//Save |dictionary| to the |plistFile|
+(NSString*) saveDictionaryToPlist: (NSMutableDictionary*) dictionary in:(NSString*)plistFile;

//Save |array| to the |plistFile|
+(NSString*) saveArrayToPlist: (NSMutableArray*) array in:(NSString*)plistFile;

@end
