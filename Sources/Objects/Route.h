//
//  Route.h
//  MU107
//
//  Created by Seregy on 1/19/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Route : NSObject

@property (strong, nonatomic) NSString* title;
@property (strong, nonatomic) NSString* price;
@property (nonatomic) BOOL isFavorite;

+(Route*) initRouteWithDictionary:(NSDictionary *)attributes;

@end
