//
//  Jogador.h
//  MusicInTheAir-Proj 3
//
//  Created by Felipe Teofilo on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Jogador : SKNode

@property int posicaoAtual;
@property NSArray *framesAnimacao;

//Alterado o método construtor
//-(id)initWithImageNamed:(NSString *)name :(float)posicao;
-(void)movimentar :(int)posicao;

@end
