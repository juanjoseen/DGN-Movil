//
//  BPCriterioViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "BPCriterioViewController.h"
#import "DataExtractor.h"
#import "SearchDetailTableViewController.h"

@interface BPCriterioViewController ()

@end

@implementation BPCriterioViewController{
    NSDate *antes;
    NSDate *despues;
    
    NSMutableArray *resNMX;
    NSMutableArray *resNOM;
}

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
    
    antes = nil;
    despues = nil;
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
        FechasViewController *fvc = (FechasViewController *)segue.destinationViewController;
        fvc.delegate = self;
    } else if ([segue.identifier isEqualToString:@"toSearchDetailSegue"]){
        SearchDetailTableViewController *sdvc = (SearchDetailTableViewController*)segue.destinationViewController;
        sdvc.allNMX = resNMX;
        sdvc.allNOM = resNOM;
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

- (void)getFecha1:(NSDate *)fecha {
    antes = fecha;
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-dd"];
    _txtFecha.text = [NSString stringWithFormat:@"%@",[dateformat stringFromDate:antes]];
    if (despues){
        _txtFecha.text = [NSString stringWithFormat:@"%@ - %@",_txtFecha.text,[dateformat stringFromDate:despues]];
    }
}

- (void)getFecha2:(NSDate *)fecha{
    despues = fecha;
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-dd"];
    if (antes){
        _txtFecha.text = [NSString stringWithFormat:@"%@ - %@",[dateformat stringFromDate:antes],[dateformat stringFromDate:despues]];
    } else {
        _txtFecha.text = [NSString stringWithFormat:@"%@",[dateformat stringFromDate:despues]];
    }
    
}


- (IBAction)buscar:(id)sender {
    
    int total = 0;
    
    if (_txtClave.text.length > 0 || _txtDep.text.length > 0 || _txtFecha.text.length > 0 || _txtRama.text.length > 0 || _definitiva.isOn){
        //NSLog(@"entra a buscar");
        //*
        DataExtractor *data = [[DataExtractor alloc] init];
        resNMX = [data buscaNMXPorClave:_txtClave.text Dependencia:_txtDep.text Definitiva:_definitiva.isOn RAE:_txtRama.text deFecha:antes hastaFecha:despues];
        resNOM = [data buscaNOMPorClave:_txtClave.text Dependencia:_txtDep.text Definitiva:_definitiva.isOn RAE:_txtRama.text deFecha:antes hastaFecha:despues];
         //*/
        
        if ((resNMX && resNMX.count > 0) || (resNOM && resNOM.count > 0)){
            if (resNMX)
                total+=resNMX.count;
            if (resNOM)
                total+=resNOM.count;
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:[NSString stringWithFormat:@"Se encontraron %d resultados en su busqueda",total] delegate:self cancelButtonTitle:@"Cancelar" otherButtonTitles: @"Ver Resultados",nil];
            [alert show];
        } else {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lo sentimos" message:@"Su busqueda no produjo resultados" delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
            [alert show];
        }
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Debe de seleccionar al menos un campo de busqueda" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *bTitle = [alertView buttonTitleAtIndex:buttonIndex];
    if ([bTitle isEqualToString:@"Ok"])
        [_txtClave becomeFirstResponder];
    else if ([bTitle isEqualToString:@"Ver Resultados"]){
        [self performSegueWithIdentifier:@"toSearchDetailSegue" sender:self];
    }
}


@end
