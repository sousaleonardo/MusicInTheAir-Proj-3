//
//  MyScene.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

@synthesize posicaoX,moverDir,moverEsq;

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
    
    [nota setPosition:CGPointMake(100, 900)];
    [self addChild:nota];
    
}

-(void)update:(CFTimeInterval)currentTime {
    
}

-(void)calcularPosicoesX{
//Irá pegar o tamanho da tela e gerar um array com o ponto medio de cada terço da view
    
    //Define o tamanho padrão do bloco
    CGFloat bloco=self.size.width/3;
    
    //Cria uma variavel tratando cada bloco de posição
    NSNumber *posicao1=[NSNumber numberWithInt:bloco/2];
    NSNumber *posicao2=[NSNumber numberWithInt:(bloco/2) + bloco];
    NSNumber *posicao3=[[NSNumber numberWithInt: (bloco/2)+(bloco*2)];
    
    [[self posicoesX]arrayByAddingObject:(id)posicao1,posicao2,posicao3)];
}



@end
