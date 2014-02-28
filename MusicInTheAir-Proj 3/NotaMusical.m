//
//  NotaMusical.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "NotaMusical.h"

@implementation NotaMusical

@synthesize som;

-(id)initNota:(NSString*)nomeSom{
    self=[super init];
    
    if (self!=nil) {
        //Sorteia um nome para a imagem =]        
        NSString *nomeImagem=[NSString stringWithFormat:@"nota%d",(arc4random()%2+1)];

        //Define a imagem da nota
        SKSpriteNode *imagemNota=[SKSpriteNode spriteNodeWithImageNamed:nomeImagem];
        
        //Define o som que será tocado ao ocorrer a colisão com o
        [self setSom:nomeSom];

        //Corpo físico para a nota cair pela tela! :)
        imagemNota.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:imagemNota.size];
        
        //Define como dynamic para que seja afetado pela gravidade
        imagemNota.physicsBody.dynamic=YES;

        //Não deixa ele rodar pela tela
        imagemNota.physicsBody.allowsRotation=NO;
        
        //definir o tamanho da imagem. tks Juh :)
        [imagemNota setScale:0.2];
        
        //Define que a nota sera afetada pela gravidade do mundo
        imagemNota.physicsBody.affectedByGravity=YES;
        
        //Define a elasticidade da nota musical
        imagemNota.physicsBody.restitution=0;
        
        //Usa a colisão precisa
        imagemNota.physicsBody.usesPreciseCollisionDetection=YES;
        
        [self addChild:imagemNota];
    }
    
    return self;
}

-(void)tocarSom{
    [self runAction:[SKAction playSoundFileNamed:[self som] waitForCompletion:NO]];
}

@end