//
//  BaseViewController.m
//  Smart Chirp
//
//  Created by Seregy on 10/22/13.
//  Copyright (c) 2013 Seregy. All rights reserved.
//

#import "BaseViewController.h"

#define NVIGATION_TAB_COLOR [UIColor colorWithRed:43.0f/255.0f green:131.0f/255.0f blue:187.0f/255.0f alpha:1.0f]

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void) viewDidLoad {
    [super viewDidLoad];
    
    // set left button
    UIButton* leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftButton setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [leftButton addTarget:self action:@selector(backBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [leftButton setFrame:CGRectMake(0.0f, 0.0f, 22.0f, 25.0f)];
    [self.navigationItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:leftButton]];
    
    [self.navigationController.navigationBar setBarTintColor:NVIGATION_TAB_COLOR];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
}

#pragma mark -
#pragma mark - General methods

- (void)alertMessageWithTitle:(NSString*) title message:(NSString*) message
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
    [alertView show];
}

- (BOOL)validateEmail:(NSString*)emailStr
{
    NSString *emailRegex = @"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}

- (void) backBtnAction:(UIButton*) sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end