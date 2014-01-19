//
//  ViewController.m
//  MU107
//
//  Created by Seregy on 1/18/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "LoginViewController.h"
#import "User.h"

@interface LoginViewController ()

- (void) privateMethod;

@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) privateMethod
{
    NSLog(@"privateMethod");
}

-(void) publicMethod
{
    NSLog(@"publicMethod");
}

- (IBAction)actionLogin:(UIButton *)sender
{
    NSLog(@"actionLogin:");
    
    User* user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    [user login];
}

@end
