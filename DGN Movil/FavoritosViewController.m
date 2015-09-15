//
//  FavoritosViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 15/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "FavoritosViewController.h"
#import "SearchByWordTableViewCell.h"
#import "DataExtractor.h"
#import "NOMNormViewController.h"
#import "NormDetailsViewController.h"

@interface FavoritosViewController ()

@end

@implementation FavoritosViewController {
    NSArray *secciones;
    
    NSMutableArray *favNOMs;
    NSMutableArray *favNMXs;
    
    NSDateFormatter *dateformat;
    
    Norma *selected;
    DataExtractor *data;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    dateformat = [[NSDateFormatter alloc] init];
    dateformat.dateFormat = @"YYYY-MM-DD";
    
    secciones = @[@"NMX", @"NOM"];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    data    = [[DataExtractor alloc] init];
    favNMXs = [data getFavoritosNMX];
    favNOMs = [data getFavoritosNOM];
    
    if (!favNMXs && !favNOMs){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Por ahora no tiene ninguna norma marcada como favorita, por favor marque algunas para poder acceder a esta seccion" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
    [self.tableView reloadData];
    [self.loading stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return secciones[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? favNMXs.count : favNOMs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    SearchByWordTableViewCell *cell = (SearchByWordTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (!cell){
        cell = [[SearchByWordTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    Norma *norma = indexPath.section == 0 ? favNMXs[indexPath.row] : favNOMs[indexPath.row];
    cell.titulo.text = norma.clave;
    cell.fecha.text = [dateformat stringFromDate:norma.fecha];
    cell.info.text = norma.titulo;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selected = indexPath.section == 0 ? favNMXs[indexPath.row]: favNOMs[indexPath.row];
    NSString *identifier = indexPath.section == 0 ? @"toNMX" : @"toNOM";
    [self performSegueWithIdentifier:identifier sender:self];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)getBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toNMX"]){
        NormDetailsViewController *ndvc = (NormDetailsViewController *)segue.destinationViewController;
        ndvc.norma = selected;
    } else if ([segue.identifier isEqualToString:@"toNOM"]){
        NOMNormViewController *nomvc = (NOMNormViewController *)segue.destinationViewController;
        nomvc.norma = selected;
    }
}

@end
