//
//  PasswordRecoveryViewController.m
//  MU107
//
//  Created by Seregy on 1/21/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "PasswordRecoveryViewController.h"

@interface PasswordRecoveryViewController ()

@property (weak, nonatomic) IBOutlet UITextField *txtEmail;

- (IBAction)sendBtn:(id)sender;

@end

@implementation PasswordRecoveryViewController

#pragma mark -
#pragma mark - View Lifecycle

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // set title
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:20.0f]};
    CGRect frame = CGRectMake(0.0f, 0.0f, [self.title sizeWithAttributes:attributes].width, 44.0f);
    UILabel* label = [[UILabel alloc] initWithFrame:frame];
    [label setBackgroundColor:[UIColor clearColor]];
    [label setFont:[UIFont systemFontOfSize:20.0f]];
    [label setTextColor:[UIColor whiteColor]];
    [label setText:@"Password Recovery"];
    [self.navigationItem setTitleView:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - View Lifecycle

- (IBAction)sendBtn:(id)sender
{
    NSString* email = self.txtEmail.text;
    if  (([email length] > 0) &&
        ([self validateEmail:email]))
    {
        [self alertMessageWithTitle:@"Thank you!" message:@"Letter already sent."];
    }
    else
    {
        [self alertMessageWithTitle:@"Error" message:@"Please enter your email address correctly."];
    }
}

@end