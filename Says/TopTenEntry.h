//
//  TopTenEntry.h
//  Says
//
//  Created by Daniel  Gomez Rico on 12/10/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 This class represents an entry for the TopTenManager
 */
@interface TopTenEntry : NSObject{
@private
    NSString* _name;
    NSInteger _points;
}

@property (nonatomic, assign) NSString * name;
@property (nonatomic, assign) NSInteger points;

-(id)initWithName: (NSString *)inName andPoints:(NSInteger)inPoints;


@end
