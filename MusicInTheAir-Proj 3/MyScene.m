//
//  MyScene.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

@synthesize moverDir,moverEsq;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        
        //Cria botão direita e esquerda
         //--
        
        //Chama função para preencher o bloco de posições X
        
        //Define a cor do fundo - Mudar p imagem =P
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //Define a gravidade da SKScene
        self.physicsWorld.gravity=CGVectorMake(0, -10);
        
        [self calcularPosicoesX];
        
        
    }
    
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NotaMusical *nota=[[NotaMusical alloc]initNota:@"beep.wav"];
    
    [nota setPosition:CGPointMake(self->posicoesX[0],500)];
    
    NotaMusical *nota2=[[NotaMusical alloc]initNota:@"beep.wav"];
    
    [nota2 setPosition:CGPointMake(self->posicoesX[1],500)];
    NotaMusical *nota3=[[NotaMusical alloc]initNota:@"beep.wav"];
    
    [nota3 setPosition:CGPointMake(self->posicoesX[2],500)];
    
    [self addChild:nota];
    [self addChild:nota2];
    [self addChild:nota3];
}

-(void)update:(CFTimeInterval)currentTime {
    
}

-(void)calcularPosicoesX{
//Irá pegar o tamanho da tela e gerar um array com o ponto medio de cada terço da view
    
    //Define o tamanho padrão do bloco
    CGFloat bloco=self.size.width/3;
    
    //Cria uma variavel tratando cada bloco de posição
    float posicao1= bloco/2;
    float posicao2=posicao1 + bloco;
    float posicao3=posicao2+bloco;
    
    self->posicoesX[0]=posicao1;
    self->posicoesX[1]=posicao2;
    self->posicoesX[2]=posicao3;
    
}



@end
