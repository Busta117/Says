//
//  TopTenManager.m
//  Says
//
//  Created by Daniel  Gomez Rico on 11/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TopTenManager.h"

#define PLIST_FILE @"PLIST_TopTen.plist"
#define DICTIONARY_KEY @"TopTenDictionary" //puede ser de cualquier tipo de numero(int, float, double)

@implementation TopTenManager


#pragma mark -
#pragma mark Initialization

- (id)init{
    self = [super init];
    if (self) {
    }
    
    return self;
}

-(NSString*) getPathPlist{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [rootPath stringByAppendingPathComponent:PLIST_FILE];
}

#pragma mark -
#pragma mark Managment

-(NSMutableDictionary*) getTopTenList{
    
    NSMutableDictionary* dictUnserialized = [[NSMutableDictionary alloc] initWithContentsOfFile: [self getPathPlist]];
    NSMutableDictionary* dictSerialized = [[NSMutableDictionary alloc] initWithCapacity:[dictUnserialized count]];
    
    if(!dictUnserialized){//If is Nil initialize a new one
        dictUnserialized = [[NSMutableDictionary alloc] init];
    }
    
    //Unserialize the entries
    for (id key in dictUnserialized){
        TopTenEntry* entry = [TopTenEntry castToEntryFromDictionary:[dictUnserialized objectForKey:key]];
        [dictSerialized setObject:entry forKey:key];
    }
    
    return dictSerialized;
}

//Update the |topTenDictionary| with the |newEntry| (search a new position and move the others if it is necessary)
-(void) update: (NSMutableDictionary*)topTenDictionary withEntry:(TopTenEntry*) newEntry{
    /*NSMutableDictionary* newTopTen = [[NSMutableDictionary alloc] initWithCapacity:[topTenDictionary count]];
    int countTopTenEntries = [topTenDictionary count];
    int keyNewEntry = countTopTenEntries;
    
    for (id key in topTenDictionary){
        
        TopTenEntry* temp = [topTenDictionary objectForKey:key];
        
        if( [temp points] < [newEntry points] ){
            
            int tempKey = [[key value] intValue];
            
            if (keyNewEntry > tempKey) {
                keyNewEntry = tempKey;
            }
            
            if(tempKey <= countTopTenEntries - 1){ //This one is eliminated from the list, is the number 0
                [newTopTen setObject:temp forKey: [NSNumber numberWithInt:tempKey+1]];
            }
            

        }
        
    }*/
}

-(void) addTopTenEntry: (TopTenEntry*) entry{
    NSString* error;
    NSString* pathPList = [self getPathPlist];
    
    NSMutableDictionary *topTen= [self getTopTenList];
    
    //Updates the dictionary
    [self update:topTen withEntry:entry];
    
//    Debugg
//    [dictionary setObject:[[[TopTenEntry new] initWithName:@"juan" andPoints:2] castToDictionary] forKey:@"4"];
//    [dictionary setObject:[[[TopTenEntry new] initWithName:@"pedro" andPoints:3] castToDictionary] forKey:@"2"];
//    [dictionary setObject:[[[TopTenEntry new] initWithName:@"jose" andPoints:4] castToDictionary] forKey:@"5"];
//    
    //Try to write in plist the new data
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList: topTen
                                                    format:NSPropertyListXMLFormat_v1_0  errorDescription:&error];
    if(plistData) {
        [plistData writeToFile:pathPList atomically:YES];
    }
    else {
        NSLog(@"Error : %@",error);
        [error release];
    }
    
    [topTen dealloc];
}



@end
