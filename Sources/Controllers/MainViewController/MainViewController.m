//
//  MainViewController.m
//  MU107
//
//  Created by Seregy on 1/22/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "MainViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MainViewController ()

@property (nonatomic, weak) IBOutlet UIImageView* pieceView;
@property (nonatomic, weak) UIView *pieceForReset;

@end

@implementation MainViewController

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
    [label setText:@"Main"];
    [self.navigationItem setTitleView:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Utility methods

/**
 Scale and rotation transforms are applied relative to the layer's anchor point this method moves a gesture recognizer's view's anchor point between the user's fingers.
 */
- (void)adjustAnchorPointForGestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if (gestureRecognizer.state == UIGestureRecognizerStateBegan) {
        UIView *piece = gestureRecognizer.view;
        CGPoint locationInView = [gestureRecognizer locationInView:piece];
        CGPoint locationInSuperview = [gestureRecognizer locationInView:piece.superview];
        
        piece.layer.anchorPoint = CGPointMake(locationInView.x / piece.bounds.size.width, locationInView.y / piece.bounds.size.height);
        piece.center = locationInSuperview;
    }
}


/**
 Display a menu with a single item to allow the piece's transform to be reset.
 */
- (IBAction
   )showResetMenu:(UILongPressGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan) {
        
        [self becomeFirstResponder];
        self.pieceForReset = [gestureRecognizer view];
        
        /*
         Set up the reset menu.
         */
        NSString *menuItemTitle = NSLocalizedString(@"Reset", @"Reset menu item title");
        UIMenuItem *resetMenuItem = [[UIMenuItem alloc] initWithTitle:menuItemTitle action:@selector(resetPiece:)];
        
        UIMenuController *menuController = [UIMenuController sharedMenuController];
        [menuController setMenuItems:@[resetMenuItem]];
        
        CGPoint location = [gestureRecognizer locationInView:[gestureRecognizer view]];
        CGRect menuLocation = CGRectMake(location.x, location.y, 0, 0);
        [menuController setTargetRect:menuLocation inView:[gestureRecognizer view]];
        
        [menuController setMenuVisible:YES animated:YES];
    }
}


/**
 Animate back to the default anchor point and transform.
 */
- (void)resetPiece:(UIMenuController *)controller
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    UIView *pieceForReset = self.pieceForReset;
    
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(pieceForReset.bounds), CGRectGetMidY(pieceForReset.bounds));
    CGPoint locationInSuperview = [pieceForReset convertPoint:centerPoint toView:[pieceForReset superview]];
    
    [[pieceForReset layer] setAnchorPoint:CGPointMake(0.5, 0.5)];
    [pieceForReset setCenter:locationInSuperview];
    
    [UIView beginAnimations:nil context:nil];
    [pieceForReset setTransform:CGAffineTransformIdentity];
    [UIView commitAnimations];
}


// UIMenuController requires that we can become first responder or it won't display
- (BOOL)canBecomeFirstResponder
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    return YES;
}

#pragma mark -
#pragma mark - Touch handling

/**
 Shift the piece's center by the pan amount.
 Reset the gesture recognizer's translation to {0, 0} after applying so the next callback is a delta from the current position.
 */
- (IBAction)panPiece:(UIPanGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    UIView *piece = [gestureRecognizer view];
    
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        CGPoint translation = [gestureRecognizer translationInView:[piece superview]];
        
        [piece setCenter:CGPointMake([piece center].x + translation.x, [piece center].y + translation.y)];
        [gestureRecognizer setTranslation:CGPointZero inView:[piece superview]];
    }
}


/**
 Rotate the piece by the current rotation.
 Reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current rotation.
 */
- (IBAction)rotatePiece:(UIRotationGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformRotate([[gestureRecognizer view] transform], [gestureRecognizer rotation]);
        [gestureRecognizer setRotation:0];
    }
}


/**
 Scale the piece by the current scale.
 Reset the gesture recognizer's rotation to 0 after applying so the next callback is a delta from the current scale.
 */
- (IBAction)scalePiece:(UIPinchGestureRecognizer *)gestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self adjustAnchorPointForGestureRecognizer:gestureRecognizer];
    
    if ([gestureRecognizer state] == UIGestureRecognizerStateBegan || [gestureRecognizer state] == UIGestureRecognizerStateChanged) {
        [gestureRecognizer view].transform = CGAffineTransformScale([[gestureRecognizer view] transform], [gestureRecognizer scale], [gestureRecognizer scale]);
        [gestureRecognizer setScale:1];
    }
}


/**
 Ensure that the pinch, pan and rotate gesture recognizers on a particular view can all recognize simultaneously.
 Prevent other gesture recognizers from recognizing simultaneously.
 */
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    NSLog(@"%@", NSStringFromSelector(_cmd));
    // If the gesture recognizers's view isn't one of our pieces, don't allow simultaneous recognition.
    if (gestureRecognizer.view != self.pieceView) {
        return NO;
    }
    
    // If the gesture recognizers are on different views, don't allow simultaneous recognition.
    if (gestureRecognizer.view != otherGestureRecognizer.view) {
        return NO;
    }
    
    // If either of the gesture recognizers is the long press, don't allow simultaneous recognition.
    if ([gestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]] || [otherGestureRecognizer isKindOfClass:[UILongPressGestureRecognizer class]]) {
        return NO;
    }
    
    return YES;
}

@end
