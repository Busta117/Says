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
        self.currentSprite = [CCMenuItemImage itemFromNormalImage:[NSString stringWithFormat:@"but-%d.png",self.tag] selectedImage:[NSString stringWithFormat:@"but-%d-hover.png",self.tag] disabledImage:[NSString stringWithFormat:@"but-%d-hover-hi.png",self.tag] target:self selector:@selector(pressButtonHuman)];
        self.currentSprite.position = pos;
        self.position = pos;
        
        self.rect = self.currentSprite.rect;
    }
    
    return self;
}

//cuando una persona unde el boton
- (void) pressButtonHuman
{
    [self playEffect];
    NSLog(@"humano preciona boton numero %d",self.tag+1);
}

//ejecuta la accion para cambiar el sprite y sonar el efecto cuando se va a mostrar la seciencia
- (void) pressButtonRobot
{
    [self playEffect];
    timerShowHide = [NSTimer scheduledTimerWithTimeInterval:0.15 target:self selector:@selector(changeSprite) userInfo:nil repeats:YES];	
    
}

//cambia el sprite del boton cuando se está mostrando la secuencia
//el truco es desactivando el boton por un instante, el boton tiene 3 estados, cada uno con una imagen, para la muestra de la secuencia se muestra el estado inactivo del boton
- (void) changeSprite
{
    if ([self.currentSprite isEnabled]) {
        [self.currentSprite setIsEnabled:NO];
    }else{
        [timerShowHide invalidate];
        [self.currentSprite setIsEnabled:YES];
    }
}


//reproduce el efento de sonido del boton
- (void) playEffect
{
    
}


@end
