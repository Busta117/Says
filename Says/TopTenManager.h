//
//  TopTenManager.h
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopTenEntry.h"

#ifndef TOP_TEN_MANAGER_H
#define TOP_TEN_MANAGER_H
extern NSString* const PATH_PLIST_FILE;
extern NSString* const DICTIONARY_KEY;
#endif

//Manages the TopTen list
@interface TopTenManager : NSObject

// Returns a dictionary with |TopTenEntry| objects. 
// The key is the position in the TopTen List and the value is the |TopTenEntry|
-(NSMutableDictionary*) getTopTenList;

// Returns the |TopTenEntry| object in the position
// Returns |nil| if the position has not been established
-(TopTenEntry*) getTopTenListWithPosition: (NSInteger*) position;

//Calculate the position in the TopTen list and add to it
-(void) addTopTenEntry: (TopTenEntry*) entry;

@end
