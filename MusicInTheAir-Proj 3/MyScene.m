//
//  MyScene.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        
        //Define a cor do fundo - Mudar p imagem =P
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //Define a gravidade da SKScene
        self.physicsWorld.gravity=CGVectorMake(0, -10);
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NotaMusical *nota=[[NotaMusical alloc]initNota:@"beep.wav"];
    
    [nota setPosition:CGPointMake(100, 900)];
    [self addChild:nota];
    
}

-(void)update:(CFTimeInterval)currentTime {
    
}

@end
