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

@property (weak, nonatomic) IBOutlet UILabel *txtLable;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	UIViewController* loginController = [self.storyboard instantiateViewControllerWithIdentifier:@"AuthNavigationController"];
    [self.navigationController presentViewController:loginController animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)setSelectRoute:(Route*) currentRuote
{
    self.txtLable.text = currentRuote.title;
}

@end