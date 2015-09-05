//
//  SearchByFilterViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 19/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DependenciasViewController.h"
#import "SelectFechasViewController.h"
#import "RAEViewController.h"

@interface SearchByFilterViewController : UIViewController<DependenciaDelegate, RAEDelegate, SelectFechasDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UITextField *txtClave;
@property (weak, nonatomic) IBOutlet UITextField *txtDependencia;
@property (weak, nonatomic) IBOutlet UITextField *txtRAE;
@property (weak, nonatomic) IBOutlet UITextField *txtFecha;
@property (weak, nonatomic) IBOutlet UISwitch *definitiva;
@end
