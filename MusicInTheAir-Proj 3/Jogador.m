//
//  Jogador.m
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "Jogador.h"

@implementation Jogador
//Alterado o método construtor
/*
-(id)initWithImageNamed:(NSString *)name :(float)posicao
{
    if (self = [super initWithImageNamed:name]) {
        //define a posicao atual do jogador
        self.posicaoAtual = 1;
        [self setPosition:CGPointMake(posicao, 20)];
        
        //Corpo fisico para o jogador
        self.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:self.size];
        
        //não permitir que a fisica influencie a posicao do jogador
        self.physicsBody.dynamic=NO;
        
        //usar detecção precisa de colisão
        self.physicsBody.usesPreciseCollisionDetection=YES;
        //Determina o jogador como dynamic=NO
        self.physicsBody.dynamic=NO;

    }
    return self;
}
 */
-(id)initJogador:(int)posicaoInicial :(float)posicaoX{
    self =[super init];
    
    if (self!=nil) {
        //Configura variaveis de controle de posicao
        [self setPosicaoAtual:1];
        
        //Cria um skspriteNode e configura ele
        SKSpriteNode *jogador=[SKSpriteNode spriteNodeWithImageNamed:@"nota1"];
        
        jogador.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:jogador.size];
        jogador.physicsBody.dynamic=NO;
        jogador.physicsBody.usesPreciseCollisionDetection=YES;
        
        [self addChild:jogador];
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
@end
