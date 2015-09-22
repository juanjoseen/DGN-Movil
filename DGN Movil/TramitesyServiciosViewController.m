//
//  TramitesyServiciosViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 21/09/15.
//  Copyright © 2015 AxkanSoftware. All rights reserved.
//

#import "TramitesyServiciosViewController.h"

@interface TramitesyServiciosViewController ()

@end

@implementation TramitesyServiciosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)getBack {
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
