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

@property (weak, nonatomic) IBOutlet UITextField *txtLogin;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction) textFieldEditingDone:(id)sender;

@end

@implementation LoginViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark - IBAction methods

- (IBAction)actionLogin:(UIButton *)sender {
    User* user = [User userWithName:self.txtLogin.text andPassword:self.txtPassword.text];
    [user login];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)textFieldEditingDone:(id)sender {
    // по кнопке Done на клавиатуре опускаем ее
    [sender resignFirstResponder];
}

@end