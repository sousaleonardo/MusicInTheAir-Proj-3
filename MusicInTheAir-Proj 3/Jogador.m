//
//  Jogador.m
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "Jogador.h"

@implementation Jogador

-(id)initWithImageNamed:(NSString *)name :(float)posicao
{
    if (self = [super initWithImageNamed:name]) {
        //define a posicao atual do jogador
        self.posicaoAtual = 1;
        [self setPosition:CGPointMake(posicao, 20)];
    
    }
    return self;
    
    
}
-(void)movimentar :(int)posicao
{   //muda a posicao atual do jogador
    if (self.position.x > posicao) {
        self.posicaoAtual++;
    }
    else
        self.posicaoAtual--;
    
    //comeca a mover o jogador
    SKAction *mover = [SKAction moveToX:posicao duration:0.5];
    [self runAction:mover];
    //chama a animaçao
    
}
<<<<<<< HEAD




=======
>>>>>>> FETCH_HEAD

@end
