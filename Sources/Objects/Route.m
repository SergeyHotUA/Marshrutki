//
//  Route.m
//  MU107
//
//  Created by Seregy on 1/19/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "Route.h"

@implementation Route

+(Route *)initRouteWithDictionary:(NSDictionary *)attributes {
    Route* route = [[Route alloc] init];
    
    route.title = attributes[@"route_title"];
    
    return route;
}

@end