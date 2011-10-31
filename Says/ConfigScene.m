//
//  ConfigScene.m
//  Says
//
//  Created by Juan Guillermo del Valle Ruiz on 10/11/11.
//  Copyright 2011 EAFIT. All rights reserved.
//

#import "ConfigScene.h"
#define FONT_NAME @"Arial"
#define FONT_SIZE 15

@implementation ConfigScene

@synthesize gameSettingsController=_gameSettingsController;


#pragma mark -
#pragma mark Init

+(id)scene {
    CCScene* scene = [CCScene node];
    CCLayer* layer = [ConfigScene node];
    [scene addChild:layer];
    return scene;
}

-(id)init {
    if ((self = [super init])) {

        self.gameSettingsController = [[GameSettingsController alloc] init];
        
        //boton efectos
        CCMenuItemImage *fxOn = [CCMenuItemImage itemFromNormalImage:@"fxOn_up.png" selectedImage:@"fxOn_up.png"];
		CCMenuItemImage *fxOff = [CCMenuItemImage itemFromNormalImage:@"fxOff_up.png" selectedImage:@"fxOff_up.png"];
		_configItemFx = [CCMenuItemToggle itemWithTarget:self selector:@selector(toggleEffectsOnOff) items:fxOn, fxOff, nil];
        
        //boton musica
        CCMenuItemImage *musicOn = [CCMenuItemImage itemFromNormalImage:@"musicOn_up.png" selectedImage:@"musicOn_dwn.png"];
		CCMenuItemImage *musicOff = [CCMenuItemImage itemFromNormalImage:@"musicOff_up.png" selectedImage:@"musicOff_dwn.png"];
		_configItemMusic = [CCMenuItemToggle itemWithTarget:self selector:@selector(toggleMusicOnOff) items:musicOn, musicOff, nil];
        //valida que cual imagien del boton poner
        if (![self.gameSettingsController canPlayEffects]) {
            _configItemFx.selectedIndex = 1;
        }
        if (![self.gameSettingsController canPlayMusic]) {
            _configItemMusic.selectedIndex = 1;
        }
        
        
        
        volumeControl = [[UISlider alloc]initWithFrame:CGRectMake(0,0, 170, 50)]; 
        [volumeControl addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged]; 
        volumeControl.backgroundColor = [UIColor clearColor];
        volumeControl.value = 0.5; 
        [[[CCDirector sharedDirector] openGLView] addSubview:volumeControl];
        
        
        //boton retroceder al menu
        CCMenuItemSprite* btnBack = [CCMenuItemSprite itemFromNormalSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                            selectedSprite:[CCSprite spriteWithFile:@"back.png"] 
                                                                    target:self 
                                                                  selector:@selector(menuBackBtnTouched:)];
        
        
        
        
        CGSize winSize = [[CCDirector sharedDirector] winSize];
        btnBack.position = CGPointMake( [btnBack contentSize].width, [btnBack contentSize].height);
        _configItemFx.position = CGPointMake( winSize.width/2, winSize.height*0.75);
        _configItemMusic.position = CGPointMake( _configItemFx.position.x, _configItemFx.position.y - [_configItemMusic contentSize].height - 5);
        
        CGPoint volumePosition = [[CCDirector sharedDirector] convertToGL:CGPointMake(_configItemMusic.position.x - [volumeControl frame].size.width/2, _configItemMusic.position.y - [_configItemMusic contentSize].height - 5)];
        [volumeControl setFrame:CGRectMake(volumePosition.x, volumePosition.y, [volumeControl frame].size.width, [volumeControl frame].size.height)];
        CCMenu* menu = [CCMenu menuWithItems:btnBack,_configItemFx,_configItemMusic, nil];
        menu.position = CGPointZero;
        [self addChild:menu];
        

        
        
    }
    return self;
}

#pragma mark -
#pragma mark UI Events

-(void)menuBackBtnTouched: (id)sender {
    [volumeControl removeFromSuperview];
    CCTransitionFade* tran = [CCTransitionFade transitionWithDuration:1 scene:[MenuLayer scene] withColor:ccWHITE];
    [[CCDirector sharedDirector] replaceScene:tran];
}

- (void) toggleEffectsOnOff
{
    [self.gameSettingsController canPlayEffects:(![self.gameSettingsController canPlayEffects])];
    
}

- (void) toggleMusicOnOff
{
    [self.gameSettingsController canPlayMusic:(![self.gameSettingsController canPlayMusic])];    
}


- (void) sliderAction:(UISlider*)sender
{
    [[[CDAudioManager sharedManager] backgroundMusic] setVolume:sender.value];
}


-(void)dealloc {
    
    [volumeControl release];
    [super dealloc];
    
}

@end
