//
//  NotaMusical.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "NotaMusical.h"

@implementation NotaMusical
@synthesize imagem,som;


-(id)initNota:(NSString*)nomeImagem :(NSString*)nomeSom{
    self=[super init];
    
    if (self!=nil) {
        
        //Define a imagem da nota
        [self setImagem:[SKSpriteNode spriteNodeWithImageNamed:nomeImagem]];
        
        //Define o som que será tocado ao ocorrer a colisão com o  
        [self setSom:nomeSom];
        
        //Corpo físico para a nota cair pela tela! :)
        self.physicsBody=[SKPhysicsBody bodyWithRectangleOfSize:[self imagem].size];
        
    }
    return self;
    
}
-(void)tocarSom{
    [self runAction:[SKAction playSoundFileNamed:[self som] waitForCompletion:NO]];
}
@end
