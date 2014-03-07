//
//  MyScene.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

@synthesize moverDir,moverEsq,lastSpawnTimeInterval,lastUpdateTimeInterval;

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]){
        //Chama método para criar musica - Importado projeto Julia
        [self criarMusica];
        
        //Seta o controle de jogo como false(Jogador não inicia perdendo)
        self->perdeu=NO;
        
        
        //Chama função para preencher o bloco de posições X
        [self calcularPosicoesX];
        
        
        //Cria o chão
        SKSpriteNode *chao=[SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(self.size.width*2, 10)];
        
        [chao setPosition:CGPointMake(10,0)];
        chao.physicsBody =[SKPhysicsBody bodyWithRectangleOfSize:chao.size];
        chao.physicsBody.affectedByGravity=YES;
        chao.physicsBody.collisionBitMask=ChaoCategory;
        chao.physicsBody.contactTestBitMask=NotaCategory;
        chao.physicsBody.usesPreciseCollisionDetection=YES;
        chao.physicsBody.dynamic=NO;
        
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"background"];
        
        [background setPosition:CGPointMake(self.size.width/2, self.size.height/2)];
        
        [background setSize:CGSizeMake(self.size.width, self.size.height)];
        
        [background setZPosition:-10];
        
        [background setAlpha:0.5];
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self addChild:background];
        
        //Define a gravidade da SKScene
        self.physicsWorld.gravity=CGVectorMake(0, -3);
        
        //Determina o delegate para colisão como a propria SKScene
        self.physicsWorld.contactDelegate=self;
        
        self.jogador = [[Jogador alloc]initWithImageNamed:@"bonequinho01" :self->posicoesX[1]];
        
        //Define a categoria p jogador e com qual categoria ele colidirá
        self.jogador.physicsBody.categoryBitMask=JogadorCategory;
        self.jogador.physicsBody.contactTestBitMask=NotaCategory;
        
        [self addChild:chao];
        [self addChild:self.jogador];
    }
         
    
    return self;
}

-(void)update:(NSTimeInterval)currentTime{
    
    if (self.jogador.vidas <=0) {
        self->perdeu=YES;
    }
    
    if (self->perdeu==NO){
        CFTimeInterval timeSinceLast=currentTime - self.lastSpawnTimeInterval;
    
        self.lastUpdateTimeInterval = currentTime;
    
        if (timeSinceLast > 0.5) {
            timeSinceLast = 1.0 / 60.0;
            self.lastUpdateTimeInterval = currentTime;
        }
    
        [self updateWithTimeSinceLastUpdate:timeSinceLast];
    }else{
        //Chama a transação para a tela de ranking
        //Cria a Scene de game over
        [self setPaused:YES];
        
        GamerOver *gameOver=[[GamerOver alloc]initGameOver:self.size :self->placar ];
        
        [self.view presentScene:gameOver];
    }
}

- (void)updateWithTimeSinceLastUpdate:(CFTimeInterval)timeSinceLast{
    
    self.lastSpawnTimeInterval += timeSinceLast;
    if (self.lastSpawnTimeInterval > 1) {
        self.lastSpawnTimeInterval = 0;
        [self criarNotas];
    }
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
    //Importado projeto Julia
    
    if(self.somAtualIndice > [[self musica00] count]){
        self.somAtualIndice = 0;
    }
    
    NotaMusical *nota=[[NotaMusical alloc]initNota: [[self musica00]objectAtIndex:[self somAtualIndice]]];
    self.somAtualIndice ++;
    
    //Define a categoria para nota p/ tratar colisao :(
    nota.physicsBody.categoryBitMask=NotaCategory;
    nota.physicsBody.contactTestBitMask=JogadorCategory;
    
    int posicaoX=arc4random()%3;
    
    [nota setPosition:CGPointMake(self->posicoesX[posicaoX], self.size.height)];
    
    [self addChild:nota];
}

-(void)didBeginContact:(SKPhysicsContact *)contact{

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
    if ((firstBody.categoryBitMask & NotaCategory)!=0) {
        if ((secondBody.categoryBitMask & ChaoCategory) !=0) {

            firstBody.node.removeFromParent;
            [self perderNota];
            
        }else if ((secondBody.categoryBitMask & JogadorCategory)!=0){
            [self runAction:[SKAction playSoundFileNamed:firstBody.node.name waitForCompletion:NO]];
            
            self->placar=self->placar+10;
            
            //Remove o node da nota da SKScene
            firstBody.node.removeFromParent;
            
        }
    }

}

-(void)perderNota{
    [[self jogador]setVidas:[self jogador].vidas -1];
    self->placar=self->placar-5;
    
}
-(void)criarMusica{
    //importado projeto Julia
    //----->SOM
    //notas
    self.notaDo = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/0.mp3", [[NSBundle mainBundle]resourcePath]]];   //00
    self.notaDo2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/1.mp3", [[NSBundle mainBundle]resourcePath]]];  //01
    self.notaRe = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/2.mp3", [[NSBundle mainBundle]resourcePath]]];   //02
    self.notaRe2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/3.mp3", [[NSBundle mainBundle]resourcePath]]];  //03
    self.notaMi = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/4.mp3", [[NSBundle mainBundle]resourcePath]]];   //04
    self.notaFa = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/5.mp3", [[NSBundle mainBundle]resourcePath]]];   //05
    self.notaFa2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/6.mp3", [[NSBundle mainBundle]resourcePath]]];  //06
    self.notaSol = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/7.mp3", [[NSBundle mainBundle]resourcePath]]];  //07
    self.notaSol2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/8.mp3", [[NSBundle mainBundle]resourcePath]]]; //08
    self.notaLa = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/9.mp3", [[NSBundle mainBundle]resourcePath]]];   //09
    self.notaLa2 = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/10.mp3", [[NSBundle mainBundle]resourcePath]]]; //10
    self.notaSi = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/11.mp3", [[NSBundle mainBundle]resourcePath]]];  //11
    

    
    //indice
    self.somAtualIndice = 0; //primeira nota do array na musica atual
    
    //array com numeros das notas
    //00 - brilha, brilha estrelinha :D
    self.musica00 = [[NSMutableArray alloc]initWithObjects: [self notaDo], [self notaDo], [self notaSol], [self notaSol],
                     [self notaLa], [self notaLa], [self notaSol], [self notaSol], [self notaFa], [self notaFa], [self notaMi],
                     [self notaMi], [self notaRe], [self notaRe], [self notaDo], [self notaDo], [self notaSol], [self notaSol],
                     [self notaFa], [self notaFa], [self notaMi], [self notaMi], [self notaRe], [self notaRe], [self notaSol],
                     [self notaSol], [self notaFa], [self notaFa], [self notaMi], [self notaMi], [self notaRe], [self notaRe],
                     [self notaDo], [self notaDo], [self notaSol], [self notaSol], [self notaLa], [self notaLa], [self notaSol],
                     [self notaSol], [self notaFa], [self notaFa], [self notaMi], [self notaMi], [self notaRe], [self notaRe],
                     [self notaDo], [self notaDo], nil];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if ([touches.anyObject locationInView:self.view].x > self.view.frame.size.width/2){
        
        int i = [self.jogador posicaoAtual];
        
        if (i == 2) {
            return;
        }
        else
            [self.jogador movimentar:self->posicoesX[i+1]];
    }
    else{
        
        int i = [self.jogador posicaoAtual];
        
        if (i == 0) {
            return;
        }
        else
            [self.jogador movimentar:self->posicoesX[i-1]];
        
    }
    
    
}
@end
