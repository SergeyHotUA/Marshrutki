//
//  RoutesViewController.h
//  MU107
//
//  Created by Seregy on 1/29/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MapViewController, Route;

@protocol RountsMenuProtocol <NSObject>

- (void) didSelectRout:(Route*)route;

@end

@interface RoutesViewController : UITableViewController

@property (weak, nonatomic) id<RountsMenuProtocol> delegate;
//@property (strong, nonatomic) MapViewController* mapViewController;

@end
