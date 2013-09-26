//
//  FLAppDelegate.m
//  FastLight
//
//  Created by Andy LaVoy on 4/2/13.
//  Copyright (c) 2013 Andy LaVoy. All rights reserved.
//

#import "FLAppDelegate.h"
#import <AVFoundation/AVFoundation.h>


@implementation FLAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.viewController = [[UIViewController alloc] init];
    [self.viewController.view setBackgroundColor:[UIColor whiteColor]];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    return YES;
}


- (void)turnLEDFlashOn {
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if ([device isTorchModeSupported:AVCaptureTorchModeOn] && [device isFlashModeSupported:AVCaptureFlashModeOn]) {
        [device lockForConfiguration:nil];
    
        [device setTorchMode:AVCaptureTorchModeOn];
        [device setFlashMode:AVCaptureFlashModeOn];
        
        [device unlockForConfiguration];
    }
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    [self turnLEDFlashOn];
}

@end
