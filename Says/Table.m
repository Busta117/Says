//
//  Table.m
//  Says
//
//  Created by Daniel  Gomez Rico on 19/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "Table.h"

#define TIME_SELECTION_USER 500 //ms, time allowed to the user wait until it touchs a button
#define TIME_CALCULATE_NEW_CELL 1000 //ms, time between each automatic touch button to show secuence

@implementation Table

@synthesize cells = _cells;

-(Table*) init{
    
    self = [super init];
    
    if(self){
        
        Cell* cell1 = [[Cell alloc] initWithSound:@"" andPress:@"blue.png" andUnpress:@"green.png"];
        Cell* cell2 = [[Cell alloc] initWithSound:@"" andPress:@"orange.png" andUnpress:@"green.png"];
        Cell* cell3 = [[Cell alloc] initWithSound:@"" andPress:@"red.png" andUnpress:@"green.png"];
        Cell* cell4 = [[Cell alloc] initWithSound:@"" andPress:@"blue.png" andUnpress:@"green.png"];
        Cell* cell5 = [[Cell alloc] initWithSound:@"" andPress:@"orange.png" andUnpress:@"green.png"];
        Cell* cell6 = [[Cell alloc] initWithSound:@"" andPress:@"red.png" andUnpress:@"green.png"];
        Cell* cell7 = [[Cell alloc] initWithSound:@"" andPress:@"blue.png" andUnpress:@"green.png"];
      
        _cells = [NSArray arrayWithObjects:cell1, cell2, cell3, cell4, cell5, cell6, cell7, nil];
        
        history = [NSMutableArray array];
        points = 0;
    }

    return self;
}


#pragma mark -
#pragma mark Release

-(void)dealloc {
    [_cells release];
    [super dealloc];
}

@end
