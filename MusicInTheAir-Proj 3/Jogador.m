//
//  Jogador.m
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "Jogador.h"

@implementation Jogador

-(id)initWithImageNamed:(NSString *)name 
{
    if (self = [super initWithImageNamed:name]) {
        self.posicaoAtual = 1;
    
    }
    return self;
    
    
}
-(void)movimentar :(int)posicao
{
    SKAction *mover = [SKAction moveToX:posicao duration:0.5];
    [self runAction:mover];
    //chama a animaçao
    
}
-

@end
