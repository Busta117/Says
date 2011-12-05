//
//  TopTenManager.m
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopTenManager.h"

#define PLIST_FILE @"PLIST_TopTen24323.plist"
#define DICTIONARY_KEY @"TopTenDictionary"
#define MAX_TOP_TEN_ENTRIES 10 //Defines the max number of top ten entries

@implementation TopTenManager


#pragma mark -
#pragma mark Initialization

+ (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

#pragma mark -
#pragma mark Managment

+(NSMutableArray*) getTopTenList
{
    NSMutableArray* unserialized = [PlistHelper getPlistData:PLIST_FILE];
    NSMutableArray* serialized = [[NSMutableArray alloc] initWithCapacity:[unserialized count]];
    
    //Unserialize the entries
    for (int i = 0; i < [unserialized count]; i++) {
        TopTenEntry* entry = [TopTenEntry deserializeFromArray:[unserialized objectAtIndex:i] ];
        [serialized addObject:entry];
    }
    
    [unserialized release];
    
    return serialized;
}

//Update the |topTenDictionary| with the |newEntry| (search a new position and move the others if it is necessary)
+(void) update: (NSMutableArray*)topTen withEntry:(TopTenEntry*) newEntry
{
    NSMutableArray* newTopTen = [NSMutableArray new];
    int lastPosition = -1;
    bool newEntryAdded = false;
    
    if([newEntry points] == 0){ //There is no highscore to manage
        return;
    }
    
    //Search the position for the new entry while it adds the entries (that have more points that the new) to the newTopTenDictionary
    for (int i = 0; i < [topTen count] ; i++) {
        TopTenEntry* entryTemp = [topTen objectAtIndex:i];
        lastPosition = i;

        if( [entryTemp points] < [newEntry points] ){//If the new entry have more points

            [newTopTen  addObject:newEntry];
            newEntryAdded = true;
            break;
            
        }else{
            [newTopTen addObject:entryTemp];
        }
    }
    
    // Is becouse there are left entries to add to the newTopTenD
    if(newEntryAdded){ 
       
        //Add the left entries to the newTopTenDiciontary with her keys updated
        for (int i = lastPosition; i < [topTen count]; i++) {
            
            //The rest must be forgiven becouse the TopTen is fully
            if([newTopTen count] == MAX_TOP_TEN_ENTRIES){
                break;
            }
            
            [newTopTen addObject:[topTen objectAtIndex:i]];

            
        }
    }else{
        if([newTopTen count] < MAX_TOP_TEN_ENTRIES){
            [newTopTen addObject:newEntry];
        }
    }
        
    //Free memory and sets the new value
    [topTen removeAllObjects];
    [topTen addObjectsFromArray:newTopTen];
    [newTopTen release];
}

+(void) addTopTenEntry: (TopTenEntry*) entry
{
    NSMutableArray *topTen = [self getTopTenList];

    //Updates the dictionary
    [TopTenManager update:topTen withEntry:entry];
        
    //Try to write in plist the new data
    [PlistHelper saveArrayToPlist:[TopTenEntry serializeToArrayOfArrays:topTen] in:PLIST_FILE];
    
    [topTen release];
}

+(void) clearTopTen
{
    [PlistHelper saveArrayToPlist:[NSMutableArray new] in:PLIST_FILE];
}


@end
