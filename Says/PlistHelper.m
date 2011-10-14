//
//  PlistManager.m
//  Says
//
//  Created by Daniel  Gomez Rico on 13/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "PlistHelper.h"

@implementation PlistHelper

+(NSString*) getRealPathPlist: (NSString*) plistFile{
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    return [rootPath stringByAppendingPathComponent:plistFile];
}

+(NSMutableDictionary*) getPlistDictionary:(NSString*)plistFile{
    return [[NSMutableDictionary alloc] initWithContentsOfFile: [self getRealPathPlist:plistFile]];
}

+(NSString*) saveToPlist: (NSMutableDictionary*) dictionary in:(NSString*)plistFile{
    NSString* error;
    NSString* pathPList = [self getRealPathPlist:plistFile];
    
    NSData *plistData = [NSPropertyListSerialization dataFromPropertyList: dictionary
                                                                   format:NSPropertyListXMLFormat_v1_0  errorDescription:&error];
    if(plistData) {
        [plistData writeToFile:pathPList atomically:YES];
    }
    else {
        NSLog(@"Error : %@",error);
        return error;
    }
    
    return nil;
}

@end
