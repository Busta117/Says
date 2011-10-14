//
//  TopTenManager.m
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopTenManager.h"

#define PLIST_FILE @"PLIST_TopTen.plist"
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

+(NSMutableDictionary*) getTopTenList
{
    NSMutableDictionary* dictUnserialized = [PlistHelper getPlistDictionary:PLIST_FILE];
    NSMutableDictionary* dictSerialized = [[NSMutableDictionary alloc] initWithCapacity:[dictUnserialized count]];
    
    //Unserialize the entries
    for (id key in dictUnserialized){
        TopTenEntry* entry = [TopTenEntry castToEntryFromDictionary:[dictUnserialized objectForKey:key]];
        [dictSerialized setObject:entry forKey:key];
    }
    
    [dictUnserialized release];
    
    return dictSerialized;
}

//Update the |topTenDictionary| with the |newEntry| (search a new position and move the others if it is necessary)
+(void) update: (NSMutableDictionary*)topTen withEntry:(TopTenEntry*) newEntry
{
    NSMutableDictionary* newTopTen = [NSMutableDictionary new];
    int lastPosition = -1, leftEntries = 0;
    bool newEntryAdded = false;
    
    //Search the position for the new entry while it adds the entries (that have more points that the new) to the newTopTenDictionary
    for (int i = 0; i < [topTen count] ; i++) {
        TopTenEntry* entryTemp = [topTen objectForKey:[CastHelper toString:i]];
        lastPosition = i;

        if( [entryTemp points] < [newEntry points] ){//If the new entry have more points
            
            [newTopTen setObject:newEntry forKey:[CastHelper toString:i]];
            newEntryAdded = true;
            break;
            
        }else{
            [newTopTen setObject:entryTemp forKey:[CastHelper toString:i]];
        }
    }
    
    // Is becouse there are left entries to add to the newTopTenD
    if(newEntryAdded){ 
        //How many entries left in the newTopTenDictionary
        leftEntries = [topTen count] - lastPosition;
        
        //Add the left entries to the newTopTenDiciontary with her keys updated
        for (int i = lastPosition; i < leftEntries; i++) {
            [newTopTen setObject:[topTen objectForKey:[CastHelper toString:i]] forKey:[CastHelper toString:i+1]];
            
            //The rest must be forgiven becouse the TopTen is fully
            if([newTopTen count] == MAX_TOP_TEN_ENTRIES){
                break;
            }
        }
    }else{
        [newTopTen setObject:newEntry forKey:[CastHelper toString:lastPosition+1]];
    }
    
    //Free memory and sets the new value
    [topTen removeAllObjects];
    [topTen addEntriesFromDictionary:newTopTen];
    [newTopTen release];
}

+(void) addTopTenEntry: (TopTenEntry*) entry
{
    NSMutableDictionary *topTen= [self getTopTenList];

    //Updates the dictionary
    [TopTenManager update:topTen withEntry:entry];
        
    //Try to write in plist the new data
    [PlistHelper saveToPlist: [TopTenEntry castToDictionaryOfDictionaries:topTen] in:PLIST_FILE];
    
    [topTen release];
}

+(void) clearTopTen
{
    [PlistHelper saveToPlist:[NSMutableDictionary new] in:PLIST_FILE];
}


@end
