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
        
        //Determina o delegate para colisão como a propria SKScene
        self.physicsWorld.contactDelegate=self;
        
        [self calcularPosicoesX];
        
        //Cria um jogador
        Jogador *jogador=[[Jogador alloc]initJogador:1 :self->posicoesX[0]];
        
        [jogador setPosicaoAtual:0];
        [jogador setPosition:CGPointMake(self->posicoesX[0], 100)];

        //Define a categoria p jogador e com qual categoria ele colidirá
        jogador.physicsBody.categoryBitMask=JogadorCategory;
        jogador.physicsBody.contactTestBitMask=NotaCategory;
        
        
        SKSpriteNode *not=[SKSpriteNode spriteNodeWithImageNamed:@"nota1"];
        
        [not setScale:0.2];
        [not setPosition:CGPointMake(self->posicoesX[0], 900)];
        not.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:not.size];
        not.physicsBody.dynamic=YES ;
        
        not.physicsBody.categoryBitMask=NotaCategory;
        not.physicsBody.contactTestBitMask=JogadorCategory;
        
        [self addChild:not];
        [self addChild:jogador];
        
            NSLog(@"carregou");
    }
         
    
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

}

-(void)update:(NSTimeInterval)currentTime{
    
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

-(void)criarNotas{
    
    NotaMusical *nota=[[NotaMusical alloc]initNota:@"beep.wav"];
    
    //Define a categoria para nota p/ tratar colisao :(
    nota.physicsBody.categoryBitMask=NotaCategory;
    nota.physicsBody.contactTestBitMask=JogadorCategory;
    
    int posicaoX=arc4random()%2;
    
    [nota setPosition:CGPointMake(self->posicoesX[posicaoX], self.size.height)];
    [self addChild:nota];
}
-(void)tocarNota:(NotaMusical*)nota{
    [nota tocarSom];
    NSLog(@"colisão");
}

-(void)didBeginContact:(SKPhysicsContact *)contact{
  //  if(self.perdeu)
       // return;
    NSLog(@"colidiu");
    // Organiza os corpos de acordo com o valor da categoria. Isto é feito para facilitar a comparação mais em baixo
    SKPhysicsBody *firstBody, *secondBody;
    
    if (contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    }
    else
    {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
    
    
    // Compara as máscaras de categoria com os valores que nós usamos para os objetos do jogo
    if ((firstBody.categoryBitMask & NotaCategory) != 0)
    {
        [self tocarNota:firstBody];
    }else{
        [self tocarNota:secondBody];
    }

}

@end
