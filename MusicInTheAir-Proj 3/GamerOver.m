//
//  GamerOver.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 06/03/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "GamerOver.h"

@implementation GamerOver

-(id)initWithSize:(CGSize)size{
    if(self=[super initWithSize:size]){
        
        [self setBackgroundColor:[SKColor grayColor]];
        
        SKSpriteNode *fundo=[SKSpriteNode spriteNodeWithImageNamed:@"exemplo.png"];
        [fundo setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        [fundo setSize:self.size];
        [fundo setZPosition:-100];
        
        SKLabelNode *mensagem=[SKLabelNode labelNodeWithFontNamed:@"Markerfelt-Thin"];
        
        [mensagem setText:@"Você perdeu! :'("];
        [mensagem setFontColor:[UIColor blackColor]];
        [mensagem setPosition:CGPointMake(self.size.width/2,(self.size.height/2 )-200)];
        [mensagem setFontSize:50.0];
        
        //Faz o texto piscar
        SKAction *sumir=[SKAction fadeOutWithDuration:0.4];
        SKAction *aparecer=[SKAction fadeInWithDuration:0.4];
        
        [mensagem runAction:[SKAction repeatActionForever:[SKAction sequence:@[sumir,aparecer]]]];

        //Adiciona na Scene
        [self addChild:mensagem];
        [self addChild:fundo];
        
    }
    
    return self;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    SKTransition *aparecer=[SKTransition flipVerticalWithDuration:0.5];
    SKScene *cenaJogo=[[MyScene alloc]initWithSize:self.size];
    [self.view presentScene:cenaJogo transition:aparecer];
    
}
-(id)initGameOver:(CGSize)size :(int)pontos{
    if(self=[super initWithSize:size]){
        
        [self setBackgroundColor:[SKColor grayColor]];
        
        SKSpriteNode *fundo=[SKSpriteNode spriteNodeWithImageNamed:@"background.png"];
        [fundo setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        [fundo setSize:self.size];
        [fundo setZPosition:-100];
        
        SKLabelNode *pontuacao=[SKLabelNode labelNodeWithFontNamed:@"Markerfelt-Thin"];
        SKLabelNode *mensagem=[SKLabelNode labelNodeWithFontNamed:@"Markerfelt-Thin"];
        
        [mensagem setText:@"Você perdeu! :'("];
        [mensagem setFontColor:[UIColor blackColor]];
        [mensagem setPosition:CGPointMake(self.size.width/2,(self.size.height/2 )-200)];
        [mensagem setFontSize:50.0];
        
        NSString *textoPont=[NSString stringWithFormat:@"Parabéns você fez: %d pontos!",pontos];
        
        [pontuacao setText:textoPont];
        
        [pontuacao setFontColor:[UIColor purpleColor]];
        [pontuacao setPosition:CGPointMake(self.size.width/2,(self.size.height/2 )-100)];
        [pontuacao setFontSize:20.0];
        
        //Faz o texto piscar
        SKAction *sumir=[SKAction fadeOutWithDuration:0.4];
        SKAction *aparecer=[SKAction fadeInWithDuration:0.4];
        
        [mensagem runAction:[SKAction repeatActionForever:[SKAction sequence:@[sumir,aparecer]]]];
        
        //Adiciona na Scene
        [self addChild:pontuacao];
        [self addChild:mensagem];
        [self addChild:fundo];
        
    }
    
    return self;
}
@end
