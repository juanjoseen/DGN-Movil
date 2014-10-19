//
//  DetailNormaViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Norma.h"

@interface DetailNormaViewController : UIViewController

@property (nonatomic, retain) Norma *norma;

@property (strong, nonatomic) IBOutlet UIScrollView *scroller;

- (void)btnSelected;
@end
