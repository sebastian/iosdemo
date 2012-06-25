//
//  GridMonitor.m
//  KettleBackup
//
//  Created by Sebastian Eide on 25/06/2012.
//  Copyright (c) 2012 Kle.io. All rights reserved.
//

#import "GridMonitor.h"

@implementation GridMonitor
@synthesize delegate = _delegate;

#pragma mark - Init

- (id) init 
{
  self = [super init];
  if (self) {
    monitorRunning = NO;
  }
  return self;
}

#pragma mark - Action

- (void) performMonitoring:(id)sender
{
  // http://caniturniton.com/api/json
  @autoreleasepool {
    while (monitorRunning) {
      NSURL *url = [NSURL URLWithString:@"http://caniturniton.com/api/json"];
      NSData *jsonData = [NSData dataWithContentsOfURL:url];
      NSError *jsonReadingError;
      NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error:&jsonReadingError];
      if (jsonReadingError) {
        NSLog(@"Error deserializing json: %@", [jsonReadingError localizedDescription]);
        break;
      }
      NSDictionary *decisionJson = [jsonDict objectForKey:@"decision"];
      NSString *recommendation = [decisionJson objectForKey:@"recommendation"];
      NSLog(@"Recommendation: %@", recommendation);

      if ([recommendation isEqualToString:@"Yes"] || [recommendation isEqualToString:@"Probably"]) {
        [self.delegate gridmonitor:self canUseKettle:YES];
      } else if ([recommendation isEqualToString:@"No"]) {
        [self.delegate gridmonitor:self canUseKettle:NO];
      } else {
        NSLog(@"Unknown recommendation state: %@", recommendation);
      }
      sleep(3);
    }
  }
}

- (void) startMonitoring
{
  monitorRunning = YES;
  [self performSelectorInBackground:@selector(performMonitoring:) withObject:self];
}

@end
