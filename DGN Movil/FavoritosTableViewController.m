//
//  FavoritosTableViewController.m
//  DGN Movil
//
//  Created by Juan on 19/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "FavoritosTableViewController.h"
#import "DataExtractor.h"
#import "NormaTableViewCell.h"

@interface FavoritosTableViewController ()

@end

@implementation FavoritosTableViewController{
    NSArray *secciones;
    
    NSMutableArray *favNOMs;
    NSMutableArray *favNMXs;
    ///HOLA JUAN AL PARECER EL GITHUB SI SIRVE
    NSDateFormatter *dateformat;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.hidden = NO;
    navBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (!favNOMs && !favNMXs){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Por ahora no tiene ninguna norma marcada como favorita, por favor marque algunas para poder acceder a esta seccion" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    secciones = @[@"NMX",@"NOM"];
    DataExtractor *data = [[DataExtractor alloc] init];
    favNMXs = [data getFavoritosNMX];
    favNOMs = [data getFavoritosNOM];
    
    dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return secciones[section];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (section == 0)
        return favNMXs.count;
    return favNOMs.count;
}

//*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormaTableViewCell *cell = (NormaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0){
        Norma *nmx = favNMXs[indexPath.row];
        cell.clave.text = nmx.clave;
        cell.fecha.text = [dateformat stringFromDate:nmx.fecha];
        cell.descripcion.text = nmx.titulo;
    } else {
        Norma *nom = favNOMs[indexPath.row];
        cell.clave.text = nom.clave;
        cell.fecha.text = [dateformat stringFromDate:nom.fecha];
        cell.descripcion.text = nom.titulo;
    }
    
    return cell;
}
// */

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (BOOL)prefersStatusBarHidden{
    return  YES;
}

@end
