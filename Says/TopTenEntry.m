//
//  TopTenEntry.m
//  Says
//
//  Created by Daniel  Gomez Rico on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "TopTenEntry.h"

@implementation TopTenEntry

#define MAX_NAME_LENGTH 15

@synthesize name = _name;
@synthesize points = _points;

#pragma mark -
#pragma mark Initialization

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    
    return self;
}

-(id)initWithName: (NSString *)inName andPoints:(int)inPoints
{
    if (self = [super init])
    {
        if([inName length] >= MAX_NAME_LENGTH){
            self.name = [NSString stringWithFormat:@"%@...",[inName substringToIndex:MAX_NAME_LENGTH] ];
        }
        else{
            self.name = inName;
        }
        self.points = inPoints;
    }
    return self;
}

#pragma mark -
#pragma mark Serializations

+(NSMutableArray*) serializeToArray:(TopTenEntry*)topTenEntry;
{
    NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:1];
    
    [array addObject:[topTenEntry name]];
    [array addObject:[NSNumber numberWithInt:[topTenEntry points]]];
    
    return array;
}

+(NSMutableArray*) serializeToArrayOfArrays:(NSMutableArray*)topTenEntries;
{
    NSMutableArray* arrayOfArrays = [[NSMutableArray alloc] initWithCapacity:[topTenEntries count]];
    
    for (TopTenEntry* entry in topTenEntries) {
        [arrayOfArrays addObject:[TopTenEntry serializeToArray:entry]];
    }
    
    return arrayOfArrays;
}

+(NSMutableDictionary*) serializeToDictionary:(TopTenEntry*)topTenEntry
{
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    [dictionary setObject:[topTenEntry name] forKey:@"name"];
    [dictionary setObject:[NSNumber numberWithInt:[topTenEntry points]] forKey:@"points"];
    return dictionary;
}

+(NSMutableDictionary*) serializeToDictionaryOfDictionaries:(NSMutableDictionary*)dictionaryTopTen
{    
    NSMutableDictionary* dictionaryOfDictionaries = [[NSMutableDictionary alloc] initWithCapacity:[dictionaryTopTen count]];
    
    for (id key in dictionaryTopTen) {
        TopTenEntry* entry = [dictionaryTopTen objectForKey:key];
        [dictionaryOfDictionaries setObject:[TopTenEntry serializeToDictionary:entry] forKey:key];
    }

    return dictionaryOfDictionaries;
}

#pragma mark -
#pragma mark Deserializations

+(TopTenEntry*) deserializeFromArray:(NSMutableArray*)topTenEntry;
{    
    return [[TopTenEntry alloc] initWithName:[topTenEntry objectAtIndex:0] 
                        andPoints: [[topTenEntry objectAtIndex:1] intValue]];
}

+(TopTenEntry*) deserializeFromDictionary:(NSMutableDictionary*)dictionary
{
    return [[TopTenEntry alloc] initWithName:[dictionary objectForKey:@"name"] 
                                   andPoints:[[dictionary objectForKey:@"points"] intValue]];
}

//The DBG console call this method to print values (Debug help)
-(NSString *) description {
    return [NSString stringWithFormat:@"TopTenEntry Name:%@ Points:%d",
            _name, _points];
}

@end

