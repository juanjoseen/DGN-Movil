//
//  BPCriterioViewController.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DependenciasTableViewController.h"
#import "RAETableViewController.h"
#import "FechasViewController.h"

@interface BPCriterioViewController : UIViewController <DependenciaDelegate,RAEDelegate,FechasDelegate,UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtClave;
@property (weak, nonatomic) IBOutlet UITextField *txtDep;
@property (weak, nonatomic) IBOutlet UITextField *txtRama;
@property (weak, nonatomic) IBOutlet UITextField *txtFecha;
@property (weak, nonatomic) IBOutlet UISwitch *definitiva;
@end
