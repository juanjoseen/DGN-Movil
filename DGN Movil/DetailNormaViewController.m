//
//  DetailNormaViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "DetailNormaViewController.h"
#import "DataExtractor.h"

@interface DetailNormaViewController ()

@end

@implementation DetailNormaViewController{
    DataExtractor *data;
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    navBar.hidden = NO;
    
    if (_norma.favorito){
        _favIcon.image = [UIImage imageNamed:@"EstrellaMedianaA"];
    }
    
    //NSLog(@"alto: %lf",navBar.frame.size.height);
    [self setTitle:_norma.clave ];
    
    _scroller = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scroller.pagingEnabled = YES;
    _scroller.contentSize = CGSizeMake(self.view.frame.size.width, self.view.frame.size.height*4);
    [self.view addSubview:_scroller];
    
    NSMutableArray *clavesNOM = [NSMutableArray array];
    NSMutableArray *claves = [NSMutableArray array];

    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    //NSDate *fecha;
    
    int j = 12, y = 0;
    if([_norma.clave containsString:@"NMX"]){
        NSArray *titulos = [NSArray arrayWithObjects:@"Clave de la Norma",@"Título de la Norma", @"Nombre del Archivo", @"Fecha de la publicación", @"Tipo de Norma", @"Producto",@"Rama de actividad económica", @"CTNN",@"ONN", nil];
        [claves addObject:_norma.clave];
        [claves addObject:_norma.titulo];
        [claves addObject:_norma.documento];
        [claves addObject:_norma.fecha];
        [claves addObject:_norma.tipoNorma];
        [claves addObject:_norma.producto];
        [claves addObject:_norma.RAE];
        [claves addObject:_norma.CTNN];
        [claves addObject:_norma.ONN];
        for (int i = 0; i < 9; i++) {
            UILabel *etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, y, self.view.frame.size.width-32,100)];
            etiquetas.font = [UIFont fontWithName:@"Verdana" size:14.0];
            etiquetas.text = titulos[i];
            etiquetas.textColor = [UIColor lightGrayColor];
            etiquetas.numberOfLines = 0;
            etiquetas.lineBreakMode = YES;
            j+=0;
            y += 78;
            [_scroller addSubview:etiquetas];
        }
        int x = 35;
        UILabel *etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,100)];
        for (int i = 0; i < 9; i++) {
            if(i == 1){
                etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,150)];
                etiquetas.font = [UIFont fontWithName:@"Verdana" size:12.0];
            }else{
                etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,100)];
                
                etiquetas.font = [UIFont fontWithName:@"Verdana" size:14.0];
            }
            
            if(i == 2){
                
                CGRect buttonFrame = CGRectMake(j, x, self.view.frame.size.width-32, 100);
                UIButton *link = [[UIButton alloc] initWithFrame:buttonFrame];
                [link setTitle:claves[i] forState:UIControlStateNormal];
                [link addTarget:self action:@selector(btnSelected) forControlEvents:UIControlEventTouchUpInside];
                [link setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
                link.titleLabel.numberOfLines = 0;
                link.titleLabel.font = [UIFont fontWithName:@"Verdana" size:10.0];
                
                [_scroller addSubview:link];
                j+=0;
                x += 78;
                continue;
                
            }
            
            
            if(i == 3){
                etiquetas.text = [dateformat stringFromDate:_norma.fecha];
                
            }else{
                etiquetas.text = claves[i];
                
            }
            etiquetas.textColor = [UIColor whiteColor];
            etiquetas.numberOfLines = 0;
            etiquetas.lineBreakMode = YES;
            j+=0;
            x += 78;
            [_scroller addSubview:etiquetas];
            
        }
    } else if([_norma.clave containsString:@"NOM"]){
        NSArray *titulosNOM = [NSArray arrayWithObjects:@"Clave de la Norma", @"Título de la Norma",@"Fecha de la publicación",@"Fecha de entrada",@"Tipo de Norma", @"Norma Internacional", @"Producto", @"Concordancia", @"Rama de actividad económica", @"Dependencia", @"CCNN", @"Nombre del Archivo", nil];
        
        
        [clavesNOM addObject:_norma.clave];
        [clavesNOM addObject:_norma.titulo];
        [clavesNOM addObject:_norma.fecha];
        [clavesNOM addObject:_norma.fechaEntrada];
        [clavesNOM addObject:_norma.tipoNorma];
        [clavesNOM addObject:_norma.normaInternacional];
        [clavesNOM addObject:_norma.producto];
        [clavesNOM addObject:_norma.concordancia];
        [clavesNOM addObject:_norma.RAE];
        [clavesNOM addObject:_norma.dependencia];
        [clavesNOM addObject:_norma.CCNN];
        [clavesNOM addObject:_norma.documento];
        for (int i = 0; i < 12; i++) {
            UILabel *etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, y, self.view.frame.size.width,100)];
            etiquetas.font = [UIFont fontWithName:@"Verdana" size:14.0];
            etiquetas.text = titulosNOM[i];
            etiquetas.textColor = [UIColor lightGrayColor];
            etiquetas.numberOfLines = 0;
            etiquetas.lineBreakMode = YES;
            j+=0;
            y += 78;
            [_scroller addSubview:etiquetas];
        }
        int x = 35;
        UILabel *etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,100)];
        for (int i = 0; i < 12; i++) {
            
            if(i == 1){
                etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,127)];
                etiquetas.font = [UIFont fontWithName:@"Verdana" size:12.0];
            }else{
                etiquetas = [[UILabel alloc] initWithFrame:CGRectMake(j, x, self.view.frame.size.width-32,100)];
                
                etiquetas.font = [UIFont fontWithName:@"Verdana" size:14.0];
            }
            
            if(i == 11){
                
                CGRect buttonFrame = CGRectMake(j, x, self.view.frame.size.width-32, 100);
                UIButton *link = [[UIButton alloc] initWithFrame:buttonFrame];
                [link setTitle:clavesNOM[i] forState:UIControlStateNormal];
                [link addTarget:self action:@selector(btnSelected) forControlEvents:UIControlEventTouchUpInside];
                [link setTitleColor: [UIColor blueColor] forState: UIControlStateNormal];
                link.titleLabel.numberOfLines = 0;
                link.titleLabel.font = [UIFont fontWithName:@"Verdana" size:10.0];

                [_scroller addSubview:link];
                j+=0;
                x += 78;
                continue;
                
            }
            
            if (i == 2) {
                etiquetas.text = [dateformat stringFromDate:_norma.fecha];
                etiquetas.textColor = [UIColor whiteColor];
                etiquetas.numberOfLines = 0;
                etiquetas.lineBreakMode = YES;
                j+=0;
                x += 78;
                [_scroller addSubview:etiquetas];
                continue;
                
            }
            
            if(i == 3){
                etiquetas.text = [dateformat stringFromDate:_norma.fechaEntrada];
                
            }else{
                etiquetas.text = clavesNOM[i];
                
            }
            etiquetas.textColor = [UIColor whiteColor];
            etiquetas.numberOfLines = 0;
            etiquetas.lineBreakMode = YES;
            j+=0;
            x += 78;
            [_scroller addSubview:etiquetas];
            
        }
    }
    
    
}

-(void) btnSelected{
    NSURL *archivoPDF = [NSURL URLWithString:_norma.documento];
    
    [[UIApplication sharedApplication] openURL:archivoPDF];
    
}
/*
 
 
 - (void)viewWillDisappear:(BOOL)animated{
 self.navigationController.navigationBar.hidden = YES;
 [super viewWillDisappear:animated];
 }
 //*/
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    data = [[DataExtractor alloc] init];
    //NSLog(@"llego norma con clave: %@", _norma.clave);
    if (_norma.dependencia && _norma.dependencia.length > 0){
        [data incNOM:_norma];
    } else {
        [data incNMX:_norma];
    }
    
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

- (IBAction)changeFav:(id)sender {
    //NSLog(@"caso");
    if ([_norma.clave containsString:@"NMX"]){
        if (![data setFavorito:!_norma.favorito aNMX:_norma]){
            NSLog(@"Error al cambiar favorito");
        }
    } else {
        [data setFavorito:!_norma.favorito aNOM:_norma];
    }
}

- (BOOL)prefersStatusBarHidden{
    return  YES;
}

@end
