//
//  ViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataExtractor.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *menu;
@property (weak, nonatomic) IBOutlet UIImageView *header;

@property (weak, nonatomic) IBOutlet UIImageView *menuSlider;
@property (weak, nonatomic) IBOutlet UIImageView *fondo;

@property (weak, nonatomic) NSString *algo;
@property (weak, nonatomic) Norma *defaultNorma;

@end

