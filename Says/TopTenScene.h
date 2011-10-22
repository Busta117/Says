//
//  TopTen.h
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "MenuLayer.h"
#import "TopTenManager.h"

@interface TopTenScene: CCLayer {
    
}

+(id)scene;
-(void)menuBackBtnTouched: (id)sender;

@end
