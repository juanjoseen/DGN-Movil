//
//  InitialViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 17/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

#define RGB_COLOR(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define RGBA_COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

@interface InitialViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *menuImage;
@property (weak, nonatomic) IBOutlet UIVisualEffectView *bgMenu;

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end
