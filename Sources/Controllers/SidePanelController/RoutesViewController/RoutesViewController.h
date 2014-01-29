//
//  RoutesViewController.h
//  MU107
//
//  Created by Seregy on 1/29/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewController;

@interface RoutesViewController : UITableViewController

@property (strong, nonatomic) MapViewController* delegate;

@end
