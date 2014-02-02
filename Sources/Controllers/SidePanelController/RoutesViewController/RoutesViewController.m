//
//  RoutesViewController.m
//  MU107
//
//  Created by Seregy on 1/29/14.
//  Copyright (c) 2014 Seregy. All rights reserved.
//

#import "RoutesViewController.h"
#import "Route.h"
#import <AFNetworking.h>
#import <MBProgressHUD.h>
#import "MapViewController.h"

#import "JASidePanelController.h"
#import "UIViewController+JASidePanel.h"

#define MENU_BACKGROUND_COLOR [UIColor colorWithRed:0.29f green:0.3f blue:0.36f alpha:1.f]

@interface RoutesViewController ()

@property (strong, nonatomic) NSMutableArray* routes;
@property (strong, nonatomic) NSMutableArray* favoriteRoutes;

@end

@implementation RoutesViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    
    [manager GET:@"http://marshrutki.com.ua/mu/routes.php" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSArray* rawRoutes = (NSArray*) responseObject;
        
        self.routes = [[NSMutableArray alloc] init];
        
        for (NSDictionary* attributes in rawRoutes) {
            [self.routes addObject:[Route initRouteWithDictionary:attributes]];
        }
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        [MBProgressHUD hideAllHUDsForView:self.tableView animated:YES];
        
        NSLog(@"Error: %@", error);
    }];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(favoritesChenget) name:@"favs" object:nil];
}

- (void) dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.routes.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route* route = (Route*)self.routes[indexPath.row];
    
    static NSString *CellIdentifier = @"Cell";
    static NSString *FavCellIdentifier = @"FavCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:route.isFavorite ? FavCellIdentifier : CellIdentifier forIndexPath:indexPath];
    
    cell.textLabel.text = route.title;
    cell.detailTextLabel.text = route.price;
    
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 20.f)];
    view.backgroundColor = MENU_BACKGROUND_COLOR;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Route* route = (Route*)self.routes[indexPath.row];

    if (self.delegate && [self.delegate respondsToSelector:@selector(didSelectRout:)])
    {
        [self.delegate didSelectRout:route];
    }
    
    [self.sidePanelController showCenterPanelAnimated:YES];
}

- (void) favoritesChenget
{
    [self.tableView reloadData];
}

@end