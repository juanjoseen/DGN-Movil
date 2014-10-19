//
//  RAETableViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RAETableViewController;

@protocol RAEDelegate <NSObject>

- (void)getRae:(NSString *)rae;

@end

@interface RAETableViewController : UITableViewController<UISearchBarDelegate>

@property (nonatomic, retain) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIToolbar *topBar;

@property (nonatomic, weak) id <RAEDelegate> delegate;

@end
