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

@interface BPCriterioViewController : UIViewController <DependenciaDelegate,RAEDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtClave;
@property (weak, nonatomic) IBOutlet UITextField *txtDep;
@property (weak, nonatomic) IBOutlet UITextField *txtTipo;
@property (weak, nonatomic) IBOutlet UITextField *txtRama;
@property (weak, nonatomic) IBOutlet UITextField *txtFecha;
@end
