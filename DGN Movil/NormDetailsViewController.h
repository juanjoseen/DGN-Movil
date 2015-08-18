//
//  NormDetailsViewController.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 18/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Norma.h"

@interface NormDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *starButton;
@property (weak, nonatomic) IBOutlet UILabel *titleLbl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic, strong) Norma *norma;

@property (weak, nonatomic) IBOutlet UILabel *lblClave;
@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (weak, nonatomic) IBOutlet UIButton *btnArchivo;
@property (weak, nonatomic) IBOutlet UILabel *lblFechaPub;
@property (weak, nonatomic) IBOutlet UILabel *lblTipoNorma;
@property (weak, nonatomic) IBOutlet UILabel *lblProduct;
@property (weak, nonatomic) IBOutlet UILabel *lblRama;
@property (weak, nonatomic) IBOutlet UILabel *lblCTNN;
@property (weak, nonatomic) IBOutlet UILabel *lblONN;


@end
