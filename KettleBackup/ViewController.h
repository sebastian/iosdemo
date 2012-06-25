//
//  ViewController.h
//  KettleBackup
//
//  Created by Sebastian Eide on 25/06/2012.
//  Copyright (c) 2012 Kle.io. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GridMonitor.h"

@interface ViewController : UIViewController <GridMonitorDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *statusImage;

- (void)gridmonitor:(GridMonitor *)monitor canUseKettle:(BOOL)gridState;

@end
