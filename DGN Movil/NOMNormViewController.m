//
//  NOMNormViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 18/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "NOMNormViewController.h"
#import "DataExtractor.h"

@interface NOMNormViewController ()

@end

@implementation NOMNormViewController{
    DataExtractor *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0] ];
    [dateformat setLocale:locale];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    
    data = [[DataExtractor alloc] init];
    
    self.titleLbl.text = self.norma.clave;
    self.lblClave.text = self.norma.clave;
    self.titleLbl.text = self.norma.titulo;
    self.lblFechaPub.text = [dateformat stringFromDate:self.norma.fecha];
    self.lblFechaEntrada.text = [dateformat stringFromDate:self.norma.fechaEntrada];
    self.lblTipo.text = self.norma.tipoNorma;
    self.lblInternacional.text = self.norma.normaInternacional;
    self.lblProducto.text = self.norma.producto;
    self.lblConcordancia.text = self.norma.concordancia;
    self.lblRama.text = self.norma.RAE;
    self.lblDependencia.text = self.norma.dependencia;
    self.lblCCNN.text = self.norma.CCNN;
    [self.btnArchivo setTitle:self.norma.documento forState:UIControlStateNormal];
    
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, MAX(730.0, self.scrollView.frame.size.height));
    
    [data incNOM:self.norma];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openFile {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:self.norma.documento];
    if ([app canOpenURL:url]){
        [app openURL:url];
    }
}

- (IBAction)changeStar {
    self.starbutton.selected = !self.starbutton.selected;
    [data setFavorito:self.starbutton.selected aNOM:self.norma];
}

- (IBAction)getBack {
    [self.navigationController popViewControllerAnimated:YES];
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
