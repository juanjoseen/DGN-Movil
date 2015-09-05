//
//  SelectFechasViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "SelectFechasViewController.h"

@interface SelectFechasViewController ()

@end

@implementation SelectFechasViewController{
    CGFloat screenHeight;
    UITextField *currentField;
    
    NSDateFormatter *formatter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    [formatter setLocale:locale];
    
    self.del1.alpha = 0.0;
    self.del2.alpha = 0.0;
    
}

- (void)viewWillAppear:(BOOL)animated{
    screenHeight = [UIScreen mainScreen].bounds.size.height;
    [self hideDatePiker:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sinceDate:(id)sender {
    currentField = self.txtFromDate;
    if (self.txtFromDate.text && self.txtFromDate.text.length > 0){
        @try {
            //NSLog(@"fecha: %@",self.txtFromDate.text);
            NSDate *date = [formatter dateFromString:self.txtFromDate.text];
            //NSLog(@"date: %@",date);
            self.datePicker.date = date;
        }
        @catch (NSException *exception) {
        }
    } else {
        NSString *fecha = [formatter stringFromDate:self.datePicker.date];
        self.txtFromDate.text = fecha;
    }
    [self showDatePicker];
    [UIView animateWithDuration:0.3 animations:^{
        self.del1.alpha = 1.0;
    }];
}

- (IBAction)toDate:(id)sender {
    currentField = self.txtToDate;
    if (self.txtFromDate.text && self.txtToDate.text.length > 0){
        @try {
            //NSLog(@"fecha: %@",self.txtToDate.text);
            NSDate *date = [formatter dateFromString:self.txtToDate.text];
            self.datePicker.date = date;
        }
        @catch (NSException *exception) {
        }
    } else {
        NSString *fecha = [formatter stringFromDate:self.datePicker.date];
        self.txtToDate.text = fecha;
    }
    [self showDatePicker];
    [UIView animateWithDuration:0.3 animations:^{
        self.del2.alpha = 1.0;
    }];
}

- (IBAction)setCurrentDate:(id)sender {
    NSString *fecha = [formatter stringFromDate:self.datePicker.date];
    currentField.text = fecha;
    [self hideDatePiker:YES];
}

- (IBAction)changeDate:(UIDatePicker *)sender {
    NSString *fecha = [formatter stringFromDate:self.datePicker.date];
    currentField.text = fecha;
}

- (void)showDatePicker{
    CGPoint center = self.dateView.center;
    center.y = screenHeight - 100.0;
    [UIView animateWithDuration:0.3 animations:^{
        self.dateView.center = center;
    }];
}

- (void)hideDatePiker:(BOOL)animated{
    CGPoint center = self.dateView.center;
    center.y = screenHeight + 100.0;
    if (animated){
        [UIView animateWithDuration:0.3 animations:^{
            self.dateView.center = center;
        }];
    } else {
        self.dateView.center = center;
    }
}
- (IBAction)borraDesde:(id)sender {
    self.txtFromDate.text = nil;
    [self hideDatePiker:YES];
    [UIView animateWithDuration:0.3 animations:^{
        self.del1.alpha = 0.0;
    }];
}
- (IBAction)borraHasta:(id)sender {
    self.txtToDate.text = nil;
    [self hideDatePiker:YES];
    [UIView animateWithDuration:0.3 animations:^{
        self.del2.alpha = 0.0;
    }];
}

- (IBAction)getBack{
    [self.delegate getFechaInicio:self.txtFromDate.text andFechaFin:self.txtToDate.text];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
