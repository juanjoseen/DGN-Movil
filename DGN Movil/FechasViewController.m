//
//  FechasViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "FechasViewController.h"

@interface FechasViewController ()

@end

@implementation FechasViewController{
    BOOL fuePrimero;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _datePicker.frame = CGRectMake(0, self.view.frame.size.height+_datePicker.frame.size.height, _datePicker.frame.size.width, _datePicker.frame.size.height);
    _okButton.alpha = 0.0;
}

- (void)aparece{
    [UIView animateWithDuration:0.3 animations:^{
        _datePicker.frame = CGRectMake(0, self.view.frame.size.height-_datePicker.frame.size.height, _datePicker.frame.size.width, _datePicker.frame.size.height);
        _okButton.alpha = 1.0;
    }];
}

- (void)desaparece{
    [UIView animateWithDuration:0.3 animations:^{
        _datePicker.frame = CGRectMake(0, self.view.frame.size.height+_datePicker.frame.size.height, _datePicker.frame.size.width, _datePicker.frame.size.height);
        _okButton.alpha = 0.0;
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _topBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    _topBar.tintColor = [UIColor whiteColor];
    
    fuePrimero = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)primero:(id)sender {
    fuePrimero = YES;
    [self aparece];
}

- (IBAction)segundo:(id)sender {
    fuePrimero = NO;
    [self aparece];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)setFecha:(id)sender {
    if (fuePrimero){
        [self.delegate getFecha1:_datePicker.date];
        
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        
        [dateformat setDateFormat:@"YYYY-MM-dd"];
        
        NSLog(@"%@", [dateformat stringFromDate:_datePicker.date]);
        _deDate.text = [dateformat stringFromDate:_datePicker.date];
    } else {
        [self.delegate getFecha2:_datePicker.date];
        
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-dd"];
        _hastaDate.text = [dateformat stringFromDate:_datePicker.date];
    }
    [self desaparece];
}
- (IBAction)regresa:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)prefersStatusBarHidden{
    return YES;
}

@end
