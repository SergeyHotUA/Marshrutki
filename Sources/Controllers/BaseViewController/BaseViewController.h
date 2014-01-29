//
//  BaseViewController.h
//  Smart Chirp
//
//  Created by Seregy on 10/22/13.
//  Copyright (c) 2013 Seregy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DebugViewController.h"

@interface BaseViewController : DebugViewController

- (BOOL)validateEmail:(NSString*)emailStr;
- (void)alertMessageWithTitle:(NSString*) title message:(NSString*) message;

@end