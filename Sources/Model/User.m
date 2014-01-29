//
//  User.m
//  MU107
//
//  Created by Seregy on 1/18/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "User.h"

@implementation User

+(User*) userWithName:(NSString*) name andPassword:(NSString*) password {
    User* user = [[User alloc] init];
    user.username = name;
    user.password = password;
    
    return user;
}

- (void) login {
    if (([self.username length] > 0) && ([self.password length] > 0)) {
        NSLog(@"Welcome! %@", self.username);
    }
    else {
        NSLog(@"Please enter your username and password");
    }
}

@end