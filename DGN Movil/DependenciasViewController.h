//
//  DependenciasViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DependenciasViewController;

@protocol DependenciaDelegate <NSObject>

- (void)getDependecy:(NSString *)dep;

@end


@interface DependenciasViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) id<DependenciaDelegate> delegate;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
