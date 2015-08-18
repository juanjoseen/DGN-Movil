//
//  NOMNormViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 18/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Norma.h"

@interface NOMNormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *starbutton;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (nonatomic, strong) Norma *norma;

@property (weak, nonatomic) IBOutlet UILabel *lblClave;
@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaPub;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaEntrada;
@property (weak, nonatomic) IBOutlet UILabel *lblTipo;
@property (weak, nonatomic) IBOutlet UILabel *lblInternacional;
@property (weak, nonatomic) IBOutlet UILabel *lblProducto;
@property (weak, nonatomic) IBOutlet UILabel *lblConcordancia;
@property (weak, nonatomic) IBOutlet UILabel *lblRama;
@property (weak, nonatomic) IBOutlet UILabel *lblDependencia;
@property (weak, nonatomic) IBOutlet UILabel *lblCCNN;
@property (weak, nonatomic) IBOutlet UIButton *btnArchivo;

@end
