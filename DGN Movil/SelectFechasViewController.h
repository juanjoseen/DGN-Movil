//
//  SelectFechasViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectFechasViewController;

@protocol SelectFechasDelegate <NSObject>

- (void)getFechaInicio:(NSString *)f1 andFechaFin:(NSString *)f2;

@end

@interface SelectFechasViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIVisualEffectView *dateView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *txtFromDate;
@property (weak, nonatomic) IBOutlet UITextField *txtToDate;
@property (weak, nonatomic) IBOutlet UIButton *del1;
@property (weak, nonatomic) IBOutlet UIButton *del2;

@property (weak, nonatomic) id<SelectFechasDelegate>delegate;

@end
