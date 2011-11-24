//
//  GameButton.m
//  Says
//
//  Created by Santiago Bustamante on 11/23/11.
//  Copyright 2011 Demens. All rights reserved.
//

#import "GameButton.h"


@implementation GameButton

@synthesize currentSprite=_currentSprite;
@synthesize position=_position;
@synthesize tag=_tag;
@synthesize pressed=_pressed;
@synthesize rect=_rect;


+ (id) buttonWithTag:(int)tagBut andPosition:(CGPoint) pos
{
    return [[[self alloc] initWithTag:tagBut andPosition:pos] autorelease];
}

- (id) initWithTag:(int)tagBut andPosition:(CGPoint) pos
{
    if ((self=[super init])) {
        
        self.pressed = NO; 
        self.tag = tagBut;
        self.currentSprite = [CCSprite spriteWithFile:[NSString stringWithFormat:@"but-%d.png",self.tag]];
        self.currentSprite.position = pos;
        self.position = pos;
        
        self.rect = CGRectMake(pos.x - self.currentSprite.contentSize.width/2, pos.y - self.currentSprite.contentSize.height/2, self.currentSprite.contentSize.width, self.currentSprite.contentSize.height);
    }
    
    return self;
}

//ejecuta la accion para cambiar el sprite y sonar el efecto
- (void) pressButton
{
    [self changeSprite];
    [self playEffect];
//    [self schedule:@selector(changeSprite) interval:1.0]; //pasado X segundos cambia otra vez la imagen del boton
    
}

- (void) changeSprite
{
    
    CCArray *framesAnim = [CCArray arrayWithCapacity:1];
    
    CCTexture2D* texture = [[CCTextureCache sharedTextureCache] addImage:[NSString stringWithFormat:@"but-%d-hover.png",self.tag]];
    CGSize texSize = texture.contentSize;
    CGRect texRect = CGRectMake(0, 0, texSize.width, texSize.height);
    CCSpriteFrame* frame = [CCSpriteFrame frameWithTexture:texture rect:texRect];
    [framesAnim addObject:frame];    
    
    CCAnimate *animation = [CCAnimate actionWithAnimation:[CCAnimation animationWithFrames:[framesAnim getNSArray]  delay:0.15f] restoreOriginalFrame:YES];
    
    [self.currentSprite runAction:animation];
    
}


//reproduce el efento de sonido del boton
- (void) playEffect
{
    
}


@end
