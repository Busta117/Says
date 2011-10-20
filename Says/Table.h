//
//  Table.h
//  Says
//
//  Created by Daniel  Gomez Rico on 19/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cell.h"

@interface Table : NSObject{
    NSArray* _cells;
    NSMutableArray*  history; //vector of int, the int is the id of each cell in |cells|
    int points;
}

-(Table*) init;


@property (nonatomic, copy)NSArray* cells;

@end
