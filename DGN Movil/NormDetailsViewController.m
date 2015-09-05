//
//  NormDetailsViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 18/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "NormDetailsViewController.h"
#import "DataExtractor.h"

@interface NormDetailsViewController ()

@end

@implementation NormDetailsViewController{
    DataExtractor *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleLbl.text = self.norma.clave;
    self.btnArchivo.titleLabel.numberOfLines = 0;
    
    data = [[DataExtractor alloc] init];
    
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0] ];
    [dateformat setLocale:locale];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    
    self.lblClave.text = self.norma.clave;
    self.lblTitulo.text = self.norma.titulo;
    [self.btnArchivo setTitle:self.norma.documento forState:UIControlStateNormal];
    self.lblFechaPub.text = [dateformat stringFromDate:self.norma.fecha];
    self.lblTipoNorma.text = self.norma.tipoNorma;
    self.lblProduct.text = self.norma.producto;
    self.lblRama.text = self.norma.RAE;
    self.lblCTNN.text = self.norma.CTNN;
    self.lblONN.text = self.norma.ONN;
    self.starButton.selected = self.norma.favorito;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [data incNMX:self.norma];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, MAX(568.0,self.scrollView.frame.size.height));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openFile:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    NSURL *url = [NSURL URLWithString:self.norma.documento];
    if ([app canOpenURL:url]){
        [app openURL:url];
    }
}

- (IBAction)changeStar {
    self.starButton.selected = !self.starButton.selected;
    [data setFavorito:self.starButton.selected aNMX:self.norma];
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
