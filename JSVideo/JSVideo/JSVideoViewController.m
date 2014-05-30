//
//  JSVideoViewController.m
//  JSVideo
//
//  Created by Javier Saiz Hernansanz on 10/01/14.
//  Copyright (c) 2014 Javier Saiz Hernansanz. All rights reserved.
//

#import "JSVideoViewController.h"
#import "JSVideoFunctions.h"

@interface JSVideoViewController ()
@property (nonatomic, strong) MPMoviePlayerController* player;
@property (assign) BOOL isLoop;
@end

@implementation JSVideoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Check for configuration file
    if ([JSVideoFunctions getUrlInfo]!=nil) {
        self.isLoop=[JSVideoFunctions getLoopMode];
        [self prepareClipPlayback];
    }else{
        NSLog(@"You must use a configure plist called JSVideoController-Info.plist. Please copy the example file SVideoController-Info.plist into your own project and configure the key/values on it.");
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self getPlayerNotifications];
    
    //Play MPMoviePlayer
    [self.player play];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    //Unregister MPMoviePlayer notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackStateDidChangeNotification
                                                  object:nil];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    //Pause/Stop MPMoviePlayer
    [self.player pause];
}

#pragma mark - Player

-(void)getPlayerNotifications{
    
    //Register MPMoviePlayer notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayerPlaybackStateChanged:)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification
                                               object:nil];
    
    
}

-(void) prepareClipPlayback{
    
    if (self.player == nil) {
        
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:[JSVideoFunctions getVideoUrl] ofType:[JSVideoFunctions getVideoType]]];
        
        self.player = [[MPMoviePlayerController alloc] initWithContentURL:url];
        [self.player setControlStyle:MPMovieControlStyleNone];
        [self.player prepareToPlay];
        
        [self.player.view setFrame:self.view.frame];
        [self.view addSubview:self.player.view];
        [self.view sendSubviewToBack:self.player.view];
        
        self.player.scalingMode = MPMovieScalingModeAspectFill;
        
    }
    
}


#pragma mark - MPMoviePlayerPlaybackStateDidChangeNotification

-(void) moviePlayerPlaybackStateChanged:(NSNotification *) notification {
    
    MPMoviePlayerController *moviePlayer = notification.object;
    MPMoviePlaybackState playbackState = moviePlayer.playbackState;
    
    NSLog(@"%ld",(long)playbackState);
    
    switch (playbackState) {
        case MPMoviePlaybackStatePaused:
        case MPMoviePlaybackStateStopped:
        case MPMoviePlaybackStateInterrupted:{
            
            if (self.isLoop) {
                moviePlayer.controlStyle = MPMovieControlStyleNone;
                [self.player play];
            }
            
            break;
            
        }
            
        default:{
            
            break;
        }
            
    }
}


@end