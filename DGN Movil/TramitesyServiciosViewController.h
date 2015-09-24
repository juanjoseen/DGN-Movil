//
//  TramitesyServiciosViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 21/09/15.
//  Copyright © 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TramitesyServiciosViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loading;
@end
