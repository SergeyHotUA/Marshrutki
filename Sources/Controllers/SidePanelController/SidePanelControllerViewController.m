//
//  MainViewController.m
//  MU107
//
//  Created by Seregy on 1/22/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "SidePanelControllerViewController.h"
#import "RoutesViewController.h"
#import "MapViewController.h"

@interface SidePanelControllerViewController ()

@end

@implementation SidePanelControllerViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void) awakeFromNib {
    UINavigationController* navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];
    MapViewController* mapController = (MapViewController*)[navigationController topViewController];
    RoutesViewController* routesController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    
    routesController.delegate = mapController;
    
    [self setLeftPanel:routesController];
    [self setCenterPanel:navigationController];
}


@end