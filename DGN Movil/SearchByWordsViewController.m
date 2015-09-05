//
//  SearchByWordsViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 17/08/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "SearchByWordsViewController.h"
#import "SearchByWordTableViewCell.h"
#import "NormDetailsViewController.h"
#import "NOMNormViewController.h"
#import "DataExtractor.h"

@interface SearchByWordsViewController ()

@end

@implementation SearchByWordsViewController{
    BOOL isSearching;
    
    BOOL hayNMX;
    BOOL hayNOM;
    
    NSMutableArray *NMX;
    NSMutableArray *NOM;
    
    NSMutableArray *sNMX;
    NSMutableArray *sNOM;
    
    NSArray *sSecciones;
    NSArray *secciones;
    
    Norma *selected;
    DataExtractor *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.tableFooterView.frame = CGRectZero;
    
    self.searchBar.delegate = self;
    
    secciones = @[@"Top 10 NMX", @"Top 10 NOM"];
    sSecciones = @[@"NMX",@"NOM"];
    data = [[DataExtractor alloc] init];
    
    sNMX = [NSMutableArray array];
    sNOM = [NSMutableArray array];
    hayNMX = YES;
    hayNOM = YES;
    
    isSearching = NO;
}

- (UIStatusBarStyle) preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    NMX = [data getTop10NMX];
    NOM = [data getTop10NOM];
    [self.tableView reloadData];
    [self.loading stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)getBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)threadStartAnimating{
    [self.loading startAnimating];
}

#pragma mark - TableView Methods -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (!isSearching){
        return 10;
    } else {
        if (section == 0)
            return sNMX.count;
        return sNOM.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchByWordTableViewCell *cell = (SearchByWordTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell)
        cell = [[SearchByWordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setTimeZone:[NSTimeZone defaultTimeZone]];
    NSLocale *locale = [NSLocale localeWithLocaleIdentifier:[[NSLocale preferredLanguages] objectAtIndex:0] ];
    [dateformat setLocale:locale];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    
    Norma *norma = nil;
    
    if (indexPath.section == 0){    // <- NMX (top o buscadas)
        norma = isSearching ? sNMX[indexPath.row] : NMX[indexPath.row];
        cell.fecha.text = [dateformat stringFromDate:norma.fecha];
    } else {    // NOM (top o buscadas)
        norma = isSearching ? sNOM[indexPath.row] : NOM[indexPath.row];
        cell.fecha.text = [dateformat stringFromDate:norma.fechaEntrada];
    }
    
    cell.titulo.text = norma.clave;
    cell.info.text = norma.titulo;
    cell.info.textAlignment = NSTextAlignmentJustified;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (isSearching)
        return sSecciones[section];
    return secciones[section];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    if (section == 0 && !hayNMX) {
        return @"No se encontraron NMX";
    } else if (section == 1 && !hayNOM){
        return @"No se encontraron NOM";
    }
    return nil;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0)
        selected = isSearching ? sNMX[indexPath.row] : NMX[indexPath.row];
    else
        selected = isSearching ? sNOM[indexPath.row] : NOM[indexPath.row];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = RGB_COLOR(3.0, 93.0, 5.0);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.searchBar resignFirstResponder];
    if (indexPath.section == 0)
        [self performSegueWithIdentifier:@"ToDetailsNMX" sender:self];
    else
        [self performSegueWithIdentifier:@"ToDetailsNOM" sender:self];
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor darkGrayColor];
}

- (void)tableView:(UITableView *)tableView didUnhighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor darkGrayColor];
}

#pragma mark - SearchBar Methods -

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    isSearching = searchBar.text.length > 2;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    isSearching = NO;
    if (searchBar.text.length > 2){
        isSearching = YES;
        [NSThread detachNewThreadSelector:@selector(threadStartAnimating) toTarget:self withObject:nil];
        sNMX = [data searchInNMX:searchText];
        sNOM = [data searchInNOM:searchText];
        hayNMX = sNMX.count > 0;
        hayNOM = sNOM.count > 0;
        [self.loading stopAnimating];
    } else {
        hayNMX = YES;
        hayNOM = YES;
    }
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
}

//*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"ToDetailsNMX"]){
        NormDetailsViewController *nvc = (NormDetailsViewController *)segue.destinationViewController;
        nvc.norma = selected;
    } else if ([segue.identifier isEqualToString:@"ToDetailsNOM"]){
        NOMNormViewController *nmv = (NOMNormViewController *)segue.destinationViewController;
        nmv.norma = selected;
    }
}
//*/

@end
