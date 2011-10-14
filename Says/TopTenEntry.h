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
    NSInteger _points;
}

@property (nonatomic, assign) NSString * name;
@property (nonatomic, assign) NSInteger points;

-(id)initWithName: (NSString *)inName andPoints:(NSInteger)inPoints;

#pragma mark -
#pragma mark Castings

//Cast the object into a dictionary (that contains keys and values for each attibute of TopTenEntry)
+(NSMutableDictionary*) castToDictionary:(TopTenEntry*)topTenEntry;

//Cast a dictionary (that contains keys name and points only) to a |TopTenEntry| object
+(TopTenEntry*) castToEntryFromDictionary:(NSMutableDictionary*)dictionary;

//Cast a dictionary (that contains |TopTenEntry| objects) to a dictionary of dictionaries (each one contain 
//the key name and points that corresponds with each TopTenEntry object.
+(NSMutableDictionary*) castToDictionaryOfDictionaries:(NSMutableDictionary*)dictionaryTopTen;

@end
