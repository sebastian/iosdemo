//
//  ViewController.m
//  KettleBackup
//
//  Created by Sebastian Eide on 25/06/2012.
//  Copyright (c) 2012 Kle.io. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize statusImage;

#pragma mark - ViewControllerCallbacks

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [self setStatusImage:nil];
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


#pragma mark - GridMonitorDelegate

- (void)gridmonitor:(GridMonitor *)monitor canUseKettle:(BOOL)gridState 
{
  dispatch_async(dispatch_get_main_queue(), ^{
    @autoreleasepool {
      if (gridState == YES) {
        [statusImage setImage:[UIImage imageNamed:@"green.png"]];
      } else {
        [statusImage setImage:[UIImage imageNamed:@"red.png"]];
      }        
    }
  });
}

@end
