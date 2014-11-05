//
//  ViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "BPPalabraTableViewController.h"
#import "DetailNormaViewController.h"

@interface ViewController ()


@end

@implementation ViewController {
    BOOL didTouchMenuSlider;
    BOOL didMoveMenuSlider;
    BOOL isMenuShowed;
    
    NSArray *opciones;
    NSArray *iconos;
    NSArray *hIconos;
    
    NSMutableArray *allNMX;
    NSMutableArray *allNOM;
    
    DataExtractor *data;
    
    CGFloat anchoOriginal;
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    anchoOriginal = self.menu.frame.size.width;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    didTouchMenuSlider = NO;
    didMoveMenuSlider = NO;
    isMenuShowed = YES;
    
    _menu.delegate = self;
    _menu.dataSource = self;
    
    opciones = [NSArray arrayWithObjects:@"Búsqueda por Palabra", @"Búsqueda por Criterio", @"Trámites y Servicios", @"Favoritos", @"Ayuda", @"Acerca de",nil];
    iconos = [NSArray arrayWithObjects:[UIImage imageNamed:@"01BLateral01BPalabra"], [UIImage imageNamed:@"01BLateral02BCriterio"], [UIImage imageNamed:@"01BLateral03Trámites"], [UIImage imageNamed:@"01BLateral03Favoritos"], [UIImage imageNamed:@"01BLateral05Ayuda"], [UIImage imageNamed:@"01BLateral06Acerca"],nil];
    hIconos = [NSArray arrayWithObjects:[UIImage imageNamed:@"01BLateral01BPalabraA"], [UIImage imageNamed:@"01BLateral02BCriterioA"], [UIImage imageNamed:@"01BLateral03TrámitesA"], [UIImage imageNamed:@"01BLateral03FavoritosA"], [UIImage imageNamed:@"01BLateral05AyudaA"], [UIImage imageNamed:@"01BLateral06AcercaA"], nil];
    
    data = [[DataExtractor alloc] init];
    
    allNMX = [data getAllNMX];
    allNOM = [data getAllNOM];
    
    self.navigationController.navigationBar.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    didTouchMenuSlider = NO;
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    
    if (CGRectContainsPoint(_menuSlider.frame, touchPoint)){
        didTouchMenuSlider = YES;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    didMoveMenuSlider = NO;
    
    CGPoint location = [[touches anyObject] locationInView:self.view];
    CGPoint prevLocation = [[touches anyObject] previousLocationInView:self.view];
    CGFloat distancia = [self distanciaEntre:location y:prevLocation];
    CGRect menuSliderPrev = _menuSlider.frame;
    CGRect menuPrev = _menu.frame;
    
    if (didTouchMenuSlider){
        _menuSlider.frame = CGRectMake(menuSliderPrev.origin.x+distancia, menuSliderPrev.origin.y, menuSliderPrev.size.width, menuSliderPrev.size.height);
        _menu.frame = CGRectMake(menuPrev.origin.x+distancia, menuPrev.origin.y, menuPrev.size.width, menuPrev.size.height);
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (didMoveMenuSlider){
        [self showHideMenu];
    } else if (didTouchMenuSlider){
        if (isMenuShowed)
            [self oculta];
        else
            [self muestra];
        isMenuShowed = !isMenuShowed;
    }
    
    didMoveMenuSlider = NO;
    didTouchMenuSlider = NO;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    didMoveMenuSlider = NO;
    didTouchMenuSlider = NO;
}

- (void)showHideMenu{
    
    CGPoint centro = CGPointMake(CGRectGetMidX(self.view.frame), CGRectGetMidY(self.view.frame));
    
    if (_menuSlider.center.x > centro.x){
        [self muestra];
    } else {
        [self oculta];
    }
}

- (void)muestra{
    CGFloat ancho = self.view.frame.size.width;
    CGFloat anchoMenuSlider = _menuSlider.frame.size.width;
    [UIView animateWithDuration:0.3 animations:^{
        _menuSlider.frame = CGRectMake(ancho-anchoMenuSlider+20, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
        _menu.frame = CGRectMake(20, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
    } completion:^(BOOL finished){
        [UIView animateWithDuration:0.2 animations:^{
            _menuSlider.frame = CGRectMake(ancho-anchoMenuSlider-10, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
            _menu.frame = CGRectMake(-10, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
        }completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                _menuSlider.frame = CGRectMake(ancho-anchoMenuSlider, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
                _menu.frame = CGRectMake(0, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
            }];
        }];
    }];
}

- (void)oculta {
    CGFloat anchoMenu = _menu.frame.size.width;
    [UIView animateWithDuration:0.3 animations:^{
        _menuSlider.frame = CGRectMake(-20, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
        _menu.frame = CGRectMake(-anchoMenu-20, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
    }completion:^(BOOL finished){
        [UIView animateWithDuration:0.2 animations:^{
            _menuSlider.frame = CGRectMake(10, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
            _menu.frame = CGRectMake(-anchoMenu+10, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
        }completion:^(BOOL finished){
            [UIView animateWithDuration:0.1 animations:^{
                _menuSlider.frame = CGRectMake(0, _menuSlider.frame.origin.y, _menuSlider.frame.size.width, _menuSlider.frame.size.height);
                _menu.frame = CGRectMake(-anchoMenu, _menu.frame.origin.y, _menu.frame.size.width, _menu.frame.size.height);
            }];
        }];
    }];
}

- (CGFloat)distanciaEntre:(CGPoint)location y:(CGPoint)prevLocation{
    return location.x-prevLocation.x;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return opciones.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    TableViewCell *cell = (TableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    //NSLog(@"iconos: %d",iconos.count);
    cell.icono.image = iconos[indexPath.row];
    cell.icono.frame = CGRectMake(9, 9, 50, 50);
    cell.titulo.text = opciones[indexPath.row];
    cell.backgroundColor = [UIColor blackColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //if (indexPath.row < 4){
        //[UIView animateWithDuration:0.3 animations:^{
        //    _menu.frame = CGRectMake(0, 0, self.view.frame.size.width, _menu.frame.size.height);
        //}completion:^(BOOL finished){
            [self performSegueWithIdentifier:[NSString stringWithFormat:@"segue%ld",(long)indexPath.row] sender:self];
        //}];
        
    //}
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = (TableViewCell*)[self.menu cellForRowAtIndexPath:indexPath];
    cell.titulo.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    cell.icono.image = hIconos[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCell *cell = (TableViewCell*)[self.menu cellForRowAtIndexPath:indexPath];
    cell.titulo.textColor = [UIColor lightGrayColor];
    cell.backgroundColor = [UIColor blackColor];
    cell.icono.image = iconos[indexPath.row];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    //_menu.frame = CGRectMake(0, 0, anchoOriginal, _menu.frame.size.height);
    if ([segue.identifier isEqualToString:@"segue0"]){
        BPPalabraTableViewController *bppvc = (BPPalabraTableViewController*)segue.destinationViewController;
        bppvc.allNMX = allNMX;
        bppvc.allNOM = allNOM;
    } else if ([segue.identifier isEqualToString:@"directSegue"]){
        DetailNormaViewController *dnvc = (DetailNormaViewController *)segue.destinationViewController;
        dnvc.norma = _defaultNorma;
    }
}

- (BOOL)prefersStatusBarHidden{
    return  YES;
}

@end
