//
//  ViewController.m
//  KettleBackup
//
//  Created by Sebastian Eide on 25/06/2012.
//  Copyright (c) 2012 Kle.io. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

#pragma mark - ViewControllerCallbacks

- (void)viewDidLoad
{
  [super viewDidLoad];
}

- (void)viewDidUnload
{
  [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

//dispatch_async(dispatch_get_main_queue(), ^{
//  @autoreleasepool {
//  }
//});

@end
