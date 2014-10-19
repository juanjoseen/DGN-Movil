//
//  BPCriterioViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "BPCriterioViewController.h"

@interface BPCriterioViewController ()

@end

@implementation BPCriterioViewController

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"dependenciaSegue"]){
        DependenciasTableViewController *dtvc = (DependenciasTableViewController *)segue.destinationViewController;
        dtvc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"raeSegue"]){
        RAETableViewController *rae = (RAETableViewController *)segue.destinationViewController;
        rae.delegate = self;
    } else if ([segue.identifier isEqualToString:@"fechasSegue"]){
        
    }
}
// */

- (BOOL)prefersStatusBarHidden{
    return  YES;
}

- (void)getDependecy:(NSString *)dep{
    _txtDep.text = dep;
}

- (void)getRae:(NSString *)rae{
    _txtRama.text = rae;
}

@end
