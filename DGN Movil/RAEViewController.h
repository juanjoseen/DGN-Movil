//
//  RAEViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RAEViewController;

@protocol RAEDelegate <NSObject>

- (void)getRAE:(NSString *)rae;

@end

@interface RAEViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) id<RAEDelegate> delegate;

@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
