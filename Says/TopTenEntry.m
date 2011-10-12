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
@end
