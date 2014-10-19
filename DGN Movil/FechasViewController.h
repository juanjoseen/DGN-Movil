//
//  FechasViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FechasViewController;

@protocol FechasDelegate <NSObject>

- (void)getFecha1:(NSDate *)fecha;
- (void)getFecha2:(NSDate *)fecha;

@end

@interface FechasViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIToolbar *topBar;
@property (weak, nonatomic) IBOutlet UITextField *deDate;
@property (weak, nonatomic) IBOutlet UITextField *hastaDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *okButton;

@property (weak, nonatomic) id <FechasDelegate> delegate;
@end
