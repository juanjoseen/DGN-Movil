//
//  SearchDetailTableViewController.m
//  DGN Movil
//
//  Created by Juan on 19/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "SearchDetailTableViewController.h"
#import "NormaTableViewCell.h"
#import "Norma.h"

@interface SearchDetailTableViewController ()

@end

@implementation SearchDetailTableViewController{
    NSArray *secciones;
    NSDateFormatter *dateformat;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    secciones = @[@"NMX",@"NOM"];
    dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
        return _allNMX.count;
    return _allNOM.count;
}

//*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormaTableViewCell *cell = (NormaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (indexPath.section == 0){
        Norma *nmx = _allNMX[indexPath.row];
        cell.clave.text = nmx.clave;
        cell.fecha.text = [dateformat stringFromDate:nmx.fecha];
        cell.descripcion.text = nmx.titulo;
    } else {
        Norma *nom = _allNOM[indexPath.row];
        cell.clave.text = nom.clave;
        cell.fecha.text = [dateformat stringFromDate:nom.fecha];
        cell.descripcion.text = nom.titulo;
    }
    
    return cell;
}
//*/

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
