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

-(id)initNota:(NSURL*)nomeSom{
    self=[super init];
    
    if (self!=nil) {
        
        //Sorteia um nome para a imagem =]        
        NSString *nomeImagem=[NSString stringWithFormat:@"nota%d",(arc4random()%2+1)];

        //Define a imagem da nota
        SKSpriteNode *imagemNota=[SKSpriteNode spriteNodeWithImageNamed:nomeImagem];
        
        //Define o som que será tocado ao ocorrer a colisão com o
        [self setSom:nomeSom];
        
        //definir o tamanho da imagem. tks Juh :)
        [imagemNota setScale:0.2];
        
        //Corpo físico para a nota cair pela tela! :)
        self.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:imagemNota.size];

        //Define como dynamic para que seja afetado pela gravidade
        self.physicsBody.dynamic=YES;

        //Não deixa ele rodar pela tela
        self.physicsBody.allowsRotation=NO;        
        
        //Define que a nota sera afetada pela gravidade do mundo
        self.physicsBody.affectedByGravity=YES;
        
        //Define a elasticidade da nota musical
        self.physicsBody.restitution=0;
        
        //Usa a colisão precisa
        self.physicsBody.usesPreciseCollisionDetection=YES;
        
        self.physicsBody.density=0.05;
        
        NSArray *arquivo=[nomeSom pathComponents];
        
        //Sera usado na identificacao da colisao
        [self setName:[arquivo lastObject]];
        
        //Importado projeto Julia
        [self setSom:nomeSom];
        
        [self addChild:imagemNota];
    }
    
    return self;
}
-(void)tocarSom{
//    AVAudioPlayer *somTocar = [[AVAudioPlayer alloc] initWithContentsOfURL:self.som error:nil];
    
    NSURL *urltst=[[NSBundle mainBundle]URLForResource:@"beep" withExtension:@"wav"];
    AVAudioPlayer *somTocar = [[AVAudioPlayer alloc]initWithContentsOfURL:urltst error:Nil];
    

    [somTocar setCurrentTime:0];
    [somTocar setEnableRate:YES];
    [somTocar setVolume:100.0];
    [somTocar setRate:0.2];
    
    [somTocar prepareToPlay];
    [somTocar play];
    
    //[self runAction:[SKAction playSoundFileNamed:[self som]  waitForCompletion:NO]];
}
@end