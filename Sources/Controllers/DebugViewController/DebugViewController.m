//
//  DebugViewController.m
//  JASidePanels
//
//  Created by Jesse Andersen on 10/23/12.
//
//

#import "DebugViewController.h"

@interface DebugViewController()

@end

@implementation DebugViewController

#pragma mark -
#pragma mark - View Lifecycle

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)willMoveToParentViewController:(UIViewController *)parent {
    [super willMoveToParentViewController:parent];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

- (void)didMoveToParentViewController:(UIViewController *)parent {
    [super didMoveToParentViewController:parent];
    NSLog(@"%@ call %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}

@end