//
//  TopTenManager.m
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopTenManager.h"

@implementation TopTenManager


NSString* const PATH_PLIST_FILE = @"TopTenList.plist";
NSString* const DICTIONARY_KEY = @"TopTenDictionary";


- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}


-(NSMutableDictionary*) getTopTenList{
    
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:PATH_PLIST_FILE];

    NSMutableDictionary *dictionary;
    dictionary = [plistDict objectForKey:DICTIONARY_KEY];
    
    return dictionary;
}

-(TopTenEntry*) getTopTenListWithPosition: (NSInteger*) position{
    return nil;
}

/*
    Update the topTenDictionary with the newEntry (search a new position and move the others if it is necessary)
*/
-(void) manageNewPosition: (NSMutableDictionary*)topTenDictionary with:(TopTenEntry*) newEntry{
}


-(void) addTopTenEntry: (TopTenEntry*) entry{
    NSMutableDictionary* plistDict = [[NSMutableDictionary alloc] initWithContentsOfFile:PATH_PLIST_FILE];    
    
    NSMutableDictionary *dictionary;
    dictionary = [self getTopTenList];
    
    if(!dictionary){//If is Nil initialize a new one
        dictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    }
    
    [dictionary setObject:[[TopTenEntry new] initWithName:@"juan" andPoints:2] forKey:@"4"];
    [dictionary setObject:[[TopTenEntry new] initWithName:@"pedro" andPoints:4] forKey:@"3"];
    [dictionary setObject:[[TopTenEntry new] initWithName:@"carlos" andPoints:7] forKey:@"2"];
    [dictionary setObject:[[TopTenEntry new] initWithName:@"don" andPoints:10] forKey:@"1"];

    
    //[self manageNewPosition:dictionary with:entry];
    
    [plistDict setValue:dictionary forKey:DICTIONARY_KEY];
    [plistDict writeToFile:PATH_PLIST_FILE atomically: YES];
    
    [dictionary dealloc];
}



@end
