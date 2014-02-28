//
//  NotaMusical.h
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
static const UInt32 NotaCategory = 0x1 << 0;

@interface NotaMusical : SKNode

@property NSString *som;

-(id)initNota:(NSString*)nomeSom;
-(void)tocarSom;
@end