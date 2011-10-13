//
//  TopTenManager.h
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TopTenEntry.h"

//Manages the TopTen list
@interface TopTenManager : NSObject

// Returns a dictionary with |TopTenEntry| objects. 
// The key is the position in the TopTen List and the value is the |TopTenEntry|
-(NSMutableDictionary*) getTopTenList;

//Calculate the position in the TopTen list and add to it
-(void) addTopTenEntry: (TopTenEntry*) entry;

@end
