//
//  MyScene.h
//  MusicInTheAir-Proj 3
//

//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NotaMusical.h"
#import "Jogador.h"

static const UInt32 NotaCategory = 0x1 << 0;
static const UInt32 JogadorCategory = 0x1 << 1;

//Adcionado o delgate p verificar contato
@interface MyScene : SKScene <SKPhysicsContactDelegate>

{
    float posicoesX[3];
    
    //controalar a frequencia de criação das notas
    double timerUpdate;
}

@property UIButton *moverDir;
@property UIButton *moverEsq;

@end
