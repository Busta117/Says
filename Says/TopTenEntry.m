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

-(NSMutableDictionary*) castToDictionary{
    NSMutableDictionary* dictionary = [[NSMutableDictionary alloc] initWithCapacity:1];
    [dictionary setObject:[self name] forKey:@"name"];
    [dictionary setObject:[NSNumber numberWithInteger:[self points]] forKey:@"points"];
    return dictionary;
}

+(TopTenEntry*) castToEntryFromDictionary:(NSMutableDictionary*)dictionary{
    return [[TopTenEntry alloc] initWithName:[dictionary objectForKey:@"name"] 
                                   andPoints:[[dictionary objectForKey:@"points"] intValue]];
}

@end

