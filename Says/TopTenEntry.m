//
//  TopTenEntry.m
//  Says
//
//  Created by Daniel  Gomez Rico on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//
#import "TopTenEntry.h"

@implementation TopTenEntry

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

-(id)initWithName: (NSString *)inName andPoints:(NSInteger)inPoints
{
    if (self = [super init])
    {
        self.name = inName;
        self.points = inPoints;
    }
    return self;
}

#pragma mark -
#pragma mark Castings

+(NSMutableDictionary*) castToDictionary:(TopTenEntry*)topTenEntry
{
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    [dictionary setObject:[topTenEntry name] forKey:@"name"];
    [dictionary setObject:[NSNumber numberWithInteger:[topTenEntry points]] forKey:@"points"];
    return dictionary;
}

+(NSMutableDictionary*) castToDictionaryOfDictionaries:(NSMutableDictionary*)dictionaryTopTen
{    
    NSMutableDictionary* dictionaryOfDictionaries = [[NSMutableDictionary alloc] initWithCapacity:[dictionaryTopTen count]];
    
    for (id key in dictionaryTopTen) {
        TopTenEntry* entry = [dictionaryTopTen objectForKey:key];
        [dictionaryOfDictionaries setObject:[TopTenEntry castToDictionary:entry] forKey:key];
    }

    return dictionaryOfDictionaries;
}

+(TopTenEntry*) castToEntryFromDictionary:(NSMutableDictionary*)dictionary
{
    return [[TopTenEntry alloc] initWithName:[dictionary objectForKey:@"name"] 
                                   andPoints:[[dictionary objectForKey:@"points"] intValue]];
}

@end

