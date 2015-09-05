//
//  ResultadoBusquedaViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "ResultadoBusquedaViewController.h"
#import "Norma.h"
#import "SearchByWordTableViewCell.h"

@interface ResultadoBusquedaViewController ()

@end

@implementation ResultadoBusquedaViewController{
    NSArray *secciones;
    NSDateFormatter *formatter;
    
    Norma *selected;
    
    BOOL hayNMX;
    BOOL hayNOM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    secciones = @[@"NMX",@"NOM"];
    formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"dd-MM-yyyy";
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0]];
    [formatter setLocale:locale];
    
    hayNMX = _allNMX.count > 0;
    hayNOM = _allNOM.count > 0;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0 && !hayNMX) {
        return @"No se encontraron NMX";
    } else if (section == 1 && !hayNOM){
        return @"No se encontraron NOM";
    }
    return nil;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return secciones[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0)
        return _allNMX.count;
    return _allNOM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchByWordTableViewCell *cell = (SearchByWordTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (!cell)
        cell = [[SearchByWordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    Norma *norma = indexPath.section == 0 ? self.allNMX[indexPath.row] : self.allNOM[indexPath.row];
    
    cell.titulo.text = norma.clave;
    cell.fecha.text = [formatter stringFromDate:norma.fecha];
    cell.info.text = norma.titulo;
    return cell;
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
