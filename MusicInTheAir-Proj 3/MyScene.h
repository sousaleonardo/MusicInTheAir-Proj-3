//
//  MyScene.h
//  MusicInTheAir-Proj 3
//

//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "NotaMusical.h"
#import "Jogador.h"
#import "GamerOver.h"
#import <AVFoundation/AVFoundation.h>
#import "ViewController.h"

static const UInt32 NotaCategory = 0x1 << 0;
static const UInt32 JogadorCategory = 0x1 << 1;
static const UInt32 ChaoCategory=0x1 << 2;

//Adcionado o delgate p verificar contato
@interface MyScene : SKScene <SKPhysicsContactDelegate>

{

    float posicoesX[3];
    
    int placar;
    //Contrla se o jogador perdeu
    Boolean *perdeu;
}

@property UIButton *moverDir;
@property UIButton *moverEsq;

//Player
@property Jogador *jogador;

//Contrala a frequencia de criacao das notas
@property (nonatomic) NSTimeInterval lastSpawnTimeInterval;
@property (nonatomic) NSTimeInterval lastUpdateTimeInterval;

//Alterações importadas projeto Julia
//----->SOM
@property int somAtualIndice;
@property NSMutableArray *musica00;

@property NSURL *notaDo; //0
@property NSURL *notaDo2; //1
@property NSURL *notaRe; //2
@property NSURL *notaRe2; //3
@property NSURL *notaMi; //4
@property NSURL *notaFa; //5
@property NSURL *notaFa2; //6
@property NSURL *notaSol; //7
@property NSURL *notaSol2; //8
@property NSURL *notaLa; //9
@property NSURL *notaLa2; //10
@property NSURL *notaSi; //11

@end
