//
//  GridMonitor.h
//  KettleBackup
//
//  Created by Sebastian Eide on 25/06/2012.
//  Copyright (c) 2012 Kle.io. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol GridMonitorDelegate;

@interface GridMonitor : NSObject {
  BOOL monitorRunning;
}

@property (nonatomic, assign) id<GridMonitorDelegate> delegate;

- (void) startMonitoring;

@end


@protocol GridMonitorDelegate <NSObject>
- (void)gridmonitor:(GridMonitor *)monitor canUseKettle:(BOOL)gridState;
@end
