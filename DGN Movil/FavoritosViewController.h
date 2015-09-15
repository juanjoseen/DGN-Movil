//
//  FavoritosViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 15/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritosViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@end
