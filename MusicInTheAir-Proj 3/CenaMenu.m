//
//  CenaMenu.m
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 28/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "CenaMenu.h"

@implementation CenaMenu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        SKSpriteNode *imagemFundo = [[SKSpriteNode alloc]initWithImageNamed:@"exemplo"];
        
<<<<<<< HEAD
        [imagemFundo setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
=======
        UIButton *Iniciar;
>>>>>>> FETCH_HEAD
        
        [imagemFundo setSize:CGSizeMake(self.size.width, self.size.height)];
        
        [self addChild:imagemFundo];
        
        SKLabelNode *iniciar = [[SKLabelNode alloc]init];
        
        [iniciar setText:@"Click to Start"];
        [iniciar setFontName:@"MarkerFelt-Thin"];
        
        
        [iniciar setFontColor:[UIColor blackColor]];
        
        [iniciar setPosition:CGPointMake((self.size.width/2)-5, (self.size.height/2)-170)];
        
        [self addChild:iniciar];
        
        
        
    
    }
    
    return self;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
}
  







@end
