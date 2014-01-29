//
//  MemberRegistrationViewController.m
//  MU107
//
//  Created by Seregy on 1/21/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "MemberRegistrationViewController.h"

@interface MemberRegistrationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtNewEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

- (IBAction)sendBtn:(id)sender;

@end

@implementation MemberRegistrationViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // set title
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f]};
    CGRect frame = CGRectMake(0.0f, 0.0f, [self.title sizeWithAttributes:attributes].width, 44.0f);
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:20.0f]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"Registration"];
    [self.navigationItem setTitleView:label];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - IBAction methods

- (IBAction)sendBtn:(id)sender {
    NSString* newEmail = self.txtNewEmail.text;
    NSString* password = self.txtPassword.text;
    if (([newEmail length] > 0) &&
        ([password length] > 0)) {
        if ([self validateEmail:newEmail]) {
                [self alertMessageWithTitle:@"Thank you!" message:@"Letter with confirmation of registration sent to your email."];
        }
        else {
            [self alertMessageWithTitle:@"Error" message:@"Please enter your email address correctly."];
        }
    }
    else {
        [self alertMessageWithTitle:@"Error" message:@"Not all fields are filled."];
    }
}

@end