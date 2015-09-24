//
//  TramitesyServiciosViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 21/09/15.
//  Copyright © 2015 AxkanSoftware. All rights reserved.
//

#import "TramitesyServiciosViewController.h"
#import "DataExtractor.h"
#import "ServicesTableViewCell.h"
#import "DetailServiciosViewController.h"

@interface TramitesyServiciosViewController ()

@end

@implementation TramitesyServiciosViewController{
    NSArray *servicios;
    Servicio *selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    DataExtractor *data = [[DataExtractor alloc] init];
    servicios = [data getServices];
    
    [self.tableView reloadData];
    [self.loading stopAnimating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods -
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return servicios.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ServicesTableViewCell *cell = (ServicesTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell)
        cell = [[ServicesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.lblTitulo.text = ((Servicio *)servicios[indexPath.row]).titulo;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selected = servicios[indexPath.row];
    [self performSegueWithIdentifier:@"toDetailServicios" sender:self];
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toDetailServicios"]){
        DetailServiciosViewController *dsvc = (DetailServiciosViewController *)segue.destinationViewController;
        dsvc.info = selected.contenido;
    }
}

- (IBAction)getBack {
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
