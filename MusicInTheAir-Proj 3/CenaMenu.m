//
//  CenaMenu.m
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 28/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "CenaMenu.h"
#import "MyScene.h"

@implementation CenaMenu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        
        //Cria e coloca a imagem de fundo
        SKSpriteNode *telaFundo = [[SKSpriteNode alloc]initWithImageNamed:@"exemplo"];
        
        [telaFundo setSize:CGSizeMake(self.size.width, self.size.height)];
        [telaFundo setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        
        [self addChild:telaFundo];
        
        
        //cria a label e coloca ela piscando na tela
        SKLabelNode *iniciar = [[SKLabelNode alloc]initWithFontNamed:@"MarkerFelt-Thin"];
        
        [iniciar setText:@"Click to Start"];
        
        [iniciar setFontColor:[UIColor blackColor]];
        
        [iniciar setPosition:CGPointMake((self.size.width/2)-5, (self.size.height/2) - 170)];
        
        SKAction *sumir = [SKAction fadeAlphaTo:0 duration:0.4];
        SKAction *aparecer = [SKAction fadeAlphaTo:1 duration:0.4];
        NSArray *piscar = [[NSArray alloc]initWithObjects:sumir,aparecer, nil];
        
        
        [iniciar runAction:[SKAction repeatActionForever:[SKAction sequence:piscar]]];
        
        [self addChild:iniciar];
    }
    
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    MyScene *cenaJogo = [[MyScene alloc]initWithSize:self.size];
    
    [self.view presentScene:cenaJogo];
    
}

@end
