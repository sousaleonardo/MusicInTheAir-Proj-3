//
//  ViewController.m
//  MusicInTheAir-Proj 3
//
//  Created by Leonardo de Sousa Mendes on 26/02/14.
//  Copyright (c) 2014 Leonardo de Sousa Mendes. All rights reserved.
//

#import "ViewController.h"
#import "MyScene.h"
#import "CenaMenu.h"
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //inserindo musica de fundo
    NSError *erro;
    NSURL *musicaFundoURL = [[NSBundle mainBundle] URLForResource:@"bg_som" withExtension:@"mp3"];
    self.musicaFundo = [[AVAudioPlayer alloc] initWithContentsOfURL:musicaFundoURL error:&erro];
    self.musicaFundo.numberOfLoops = -1;
    [self.musicaFundo setVolume:0.03f];
    [self.musicaFundo prepareToPlay];
    [self.musicaFundo play];
    
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [CenaMenu sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
@end
