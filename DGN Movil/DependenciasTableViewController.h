//
//  DependenciasTableViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DependenciasTableViewController;

@protocol DependenciaDelegate <NSObject>

- (void)getDependecy:(NSString *)dep;

@end

@interface DependenciasTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIToolbar *topBar;

@property (weak, nonatomic) id <DependenciaDelegate> delegate;

@end
