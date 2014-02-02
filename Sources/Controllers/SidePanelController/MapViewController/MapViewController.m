//
//  MapViewController.m
//  MU107
//
//  Created by Seregy on 1/29/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "MapViewController.h"
#import "Route.h"

@interface MapViewController ()

@property (strong, nonatomic) UIBarButtonItem* favoriteBatButton;
@property (strong, nonatomic) Route* currentRout;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	//UIViewController* loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    //[self.navigationController presentViewController:loginController animated:NO completion:nil];
    self.favoriteBatButton = [[UIBarButtonItem alloc] initWithTitle:@"☆" style:UIBarButtonItemStyleBordered target:self action:@selector(favAction)];
    self.navigationItem.rightBarButtonItem = self.favoriteBatButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void) didSelectRout:(Route *)route
{
    self.currentRout = route;
    self.title = route.title;
    self.favoriteBatButton.title = route.isFavorite ? @"★" : @"☆";
}
- (void) favAction
{
    self.currentRout.isFavorite = !self.currentRout.isFavorite;
    self.favoriteBatButton.title = self.currentRout.isFavorite ? @"★" : @"☆";
    [[NSNotificationCenter defaultCenter] postNotificationName:@"favs" object:nil];
}

@end