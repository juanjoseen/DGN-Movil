//
//  InitialViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 17/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "InitialViewController.h"
#import "MenuTableViewCell.h"

@interface InitialViewController ()

@end

@implementation InitialViewController{
    BOOL isTouchingMenu;
    BOOL isMoving;
    
    NSArray *opciones;
    NSArray *iconos;
    NSArray *hIconos;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    isTouchingMenu = NO;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView.frame = CGRectZero;
    
    opciones = [NSArray arrayWithObjects:@"Búsqueda por Palabra", @"Búsqueda por Criterio", @"Trámites y Servicios", @"Favoritos", @"Ayuda", @"Acerca de",nil];
    iconos = [NSArray arrayWithObjects:[UIImage imageNamed:@"01BLateral01BPalabra"], [UIImage imageNamed:@"01BLateral02BCriterio"], [UIImage imageNamed:@"01BLateral03Trámites"], [UIImage imageNamed:@"01BLateral03Favoritos"], [UIImage imageNamed:@"01BLateral05Ayuda"], [UIImage imageNamed:@"01BLateral06Acerca"],nil];
    hIconos = [NSArray arrayWithObjects:[UIImage imageNamed:@"01BLateral01BPalabraA"], [UIImage imageNamed:@"01BLateral02BCriterioA"], [UIImage imageNamed:@"01BLateral03TrámitesA"], [UIImage imageNamed:@"01BLateral03FavoritosA"], [UIImage imageNamed:@"01BLateral05AyudaA"], [UIImage imageNamed:@"01BLateral06AcercaA"], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    isTouchingMenu = NO;
    CGPoint touchPoint = [[touches anyObject] locationInView:self.view];
    if (CGRectContainsPoint(self.menuImage.frame, touchPoint)){
        isTouchingMenu = YES;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    isMoving = NO;
    if (isTouchingMenu){
        isMoving = YES;
        CGPoint prev = [[touches anyObject] previousLocationInView:self.view];
        CGPoint curr = [[touches anyObject] locationInView:self.view];
        CGFloat diff = curr.x - prev.x;
        self.menuImage.frame = CGRectOffset(self.menuImage.frame, diff, 0.0);
        self.bgMenu.frame = CGRectOffset(self.bgMenu.frame, diff, 0.0);
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (isTouchingMenu){
        if (isMoving){ // <- Si estuvo moviendose
            CGFloat x = self.menuImage.frame.origin.x;
            CGFloat final = (self.menuImage.center.x <= self.view.center.x) ? 0 : self.view.frame.size.width-60.0;
            CGFloat diff = final - x;
            self.view.userInteractionEnabled = NO;
            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.menuImage.frame = CGRectOffset(self.menuImage.frame, diff, 0.0);
                self.bgMenu.frame = CGRectOffset(self.bgMenu.frame, diff, 0.0);
            } completion:^(BOOL finished) {
                self.view.userInteractionEnabled = YES;
                isMoving = NO;
            }];
        } else { // <- Si sólo toco
            CGFloat x = self.menuImage.frame.origin.x;
            CGFloat dist = (x > 0) ? -(self.view.frame.size.width-60.0) : self.view.frame.size.width-60.0;
            self.view.userInteractionEnabled = NO;
            [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:0.5 initialSpringVelocity:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
                self.menuImage.frame = CGRectOffset(self.menuImage.frame, dist, 0.0);
                self.bgMenu.frame = CGRectOffset(self.bgMenu.frame, dist, 0.0);
            } completion:^(BOOL finished) {
                self.view.userInteractionEnabled = YES;
            }];
        }
    }
    isTouchingMenu = NO;
}

#pragma mark - TableView Methods -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return opciones.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuTableViewCell *cell = (MenuTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
        cell = [[MenuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    cell.icono.image = iconos[indexPath.row];
    cell.texto.text = opciones[indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.texto.textColor = [UIColor whiteColor];
    cell.backgroundColor = RGB_COLOR(3.0, 93.0, 5.0);//[UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    cell.icono.image = hIconos[indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *nombre = [NSString stringWithFormat:@"segue%d",(int)indexPath.row];
    if (indexPath.row < 1)
    [self performSegueWithIdentifier:nombre sender:self];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    MenuTableViewCell *cell = (MenuTableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    cell.texto.textColor = [UIColor lightGrayColor];
    cell.backgroundColor = [UIColor clearColor];
    cell.icono.image = iconos[indexPath.row];
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
