//
//  SearchByFilterViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 19/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "SearchByFilterViewController.h"
#import "ResultadoBusquedaViewController.h"
#import "DataExtractor.h"

@interface SearchByFilterViewController ()

@end

@implementation SearchByFilterViewController{
    NSMutableArray *resNMX;
    NSMutableArray *resNOM;
    
    NSDate *antes;
    NSDate *despues;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchScroll:)];
    tap.numberOfTapsRequired = 1;
    tap.numberOfTouchesRequired = 1;
    
    [self.scrollView addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchScroll:(UITapGestureRecognizer *)tap{
    CGPoint touchPoint = [tap locationInView:self.scrollView];
    // Si tocó dentro del textField de dependencia
    if (CGRectContainsPoint(self.txtDependencia.frame, touchPoint)){
        [self performSegueWithIdentifier:@"toDependencias" sender:self];
    } else if (CGRectContainsPoint(self.txtRAE.frame, touchPoint)){
        [self performSegueWithIdentifier:@"toRAE" sender:self];
    } else if (CGRectContainsPoint(self.txtFecha.frame, touchPoint)){
        [self performSegueWithIdentifier:@"toFechas" sender:self];
    }
}


- (IBAction)buscar:(id)sender {
    // Si se ha llenado al menos un campo
    if (self.txtClave.text.length > 0 || self.txtDependencia.text.length > 0 || self.txtRAE.text.length > 0 || self.txtFecha.text.length > 0){
        DataExtractor *data = [[DataExtractor alloc] init];
        resNMX = [data buscaNMXPorClave:self.txtClave.text Dependencia:self.txtDependencia.text Definitiva:self.definitiva.isOn RAE:self.txtRAE.text deFecha:antes hastaFecha:despues];
        resNOM = [data buscaNOMPorClave:self.txtClave.text Dependencia:self.txtDependencia.text Definitiva:self.definitiva.isOn RAE:self.txtRAE.text deFecha:antes hastaFecha:despues];
        int total = 0;
        if (resNMX)
            total += resNMX.count;
        if (resNOM)
            total += resNOM.count;
        
        if (total == 0){
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Su busqueda no produjo resultados" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
            [alert show];
        } else {
            [self performSegueWithIdentifier:@"toSearchDetailSegue" sender:self];
        }
            
    } else {    // <- Si no se ha llenado o seleccionado ningun campo
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alerta" message:@"Debe de seleccionar al menos un criterio de búsqueda" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}


#pragma mark - Delegados -

- (void)getDependecy:(NSString *)dep{
    self.txtDependencia.text = dep;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)getRAE:(NSString *)rae{
    self.txtRAE.text = rae;
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)getFechaInicio:(NSString *)f1 andFechaFin:(NSString *)f2{
    NSString *fechas = nil;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    [formatter setLocale:locale];
    
    if (f1.length>0 && f2.length > 0){
        fechas = [NSString stringWithFormat:@"De %@ a %@",f1,f2];
        antes   = [formatter dateFromString:f1];
        despues = [formatter dateFromString:f2];
    } else {
        if (f1.length>0){
            fechas = [NSString stringWithFormat:@"Desde %@",f1];
            antes = [formatter dateFromString:f1];
        } else if (f2.length>0){
            fechas = [NSString stringWithFormat:@"Hasta %@",f2];
            despues = [formatter dateFromString:f2];
        }
    }
    self.txtFecha.text = fechas;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toDependencias"]){
        DependenciasViewController *dvc = (DependenciasViewController *)segue.destinationViewController;
        dvc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"toRAE"]){
        RAEViewController *raevc = (RAEViewController *)segue.destinationViewController;
        raevc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"toFechas"]){
        SelectFechasViewController *sfvc = (SelectFechasViewController *)segue.destinationViewController;
        sfvc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"toSearchDetailSegue"]){
        ResultadoBusquedaViewController *rbvc = (ResultadoBusquedaViewController *)segue.destinationViewController;
        rbvc.allNMX = resNMX;
        rbvc.allNOM = resNOM;
    }
}

- (IBAction)getBack {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)inputClave {
    [self.txtClave becomeFirstResponder];
}

- (IBAction)endClave {
    [self.txtClave resignFirstResponder];
}
@end
