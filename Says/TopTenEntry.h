//
//  TopTenEntry.h
//  Says
//
//  Created by Daniel  Gomez Rico on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


//This class represents an entry for the TopTenManager
@interface TopTenEntry : NSObject{
@private
    NSString* _name;
    int _points;
}

@property (nonatomic, copy) NSString* name;
@property (nonatomic, assign) int points;

-(id)initWithName: (NSString *)inName andPoints:(int)inPoints;

#pragma mark -
#pragma mark Serializations

//Cast the object into an array (that contains keys and values for each attibute of TopTenEntry)
+(NSMutableArray*) serializeToArray:(TopTenEntry*)topTenEntry;

//Cast an array (that contains |TopTenEntry| objects) to an array of arrays (each one contain 
//the key name and points that corresponds with each TopTenEntry object.
+(NSMutableArray*) serializeToArrayOfArrays:(NSMutableArray*)topTenEntries;

//Cast the object into a dictionary (that contains keys and values for each attibute of TopTenEntry)
+(NSMutableDictionary*) serializeToDictionary:(TopTenEntry*)topTenEntry;

//Cast a dictionary (that contains |TopTenEntry| objects) to a dictionary of dictionaries (each one contain 
//the key name and points that corresponds with each TopTenEntry object.
+(NSMutableDictionary*) serializeToDictionaryOfDictionaries:(NSMutableDictionary*)dictionaryTopTen;

#pragma mark -
#pragma mark Deserializations

//Cast an array (that contains keys name and points only) to a |TopTenEntry| object
+(TopTenEntry*) deserializeFromArray:(NSMutableArray*)topTenEntry;

//Cast a dictionary (that contains keys name and points only) to a |TopTenEntry| object
+(TopTenEntry*) deserializeFromDictionary:(NSMutableDictionary*)dictionary;


@end
