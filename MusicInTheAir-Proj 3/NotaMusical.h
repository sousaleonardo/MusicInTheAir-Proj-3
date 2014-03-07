//
//  NotaMusical.h
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import <AVFoundation/AVFoundation.h>

@interface NotaMusical : SKNode

@property NSURL *som;

-(id)initNota:(NSURL*)nomeSom;
-(void)tocarSom;

@end