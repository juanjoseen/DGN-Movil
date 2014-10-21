//
//  BPPalabraTableViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "BPPalabraTableViewController.h"
#import "DataExtractor.h"
#import "NormaTableViewCell.h"
#import "DetailNormaViewController.h"

NSString *favorita = @"EstrellaChica";
NSString *noFavorita = @"01BLateral04FavoritosA";

@interface BPPalabraTableViewController ()

@end

@implementation BPPalabraTableViewController{
    NSArray *sSecciones;
    NSArray *secciones;
    BOOL isSearching;
    NSMutableArray *NMX;
    NSMutableArray *NOM;
    
    NSMutableArray *sNMX;
    NSMutableArray *sNOM;
    
    BOOL cargo;
    
    Norma *selected;
    
}

/*
- (void)viewWillAppear:(BOOL)animated{
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.frame = CGRectMake(0, -navBar.frame.size.height, navBar.frame.size.width, navBar.frame.size.height);
    //[self.tableView setContentOffset:CGPointZero animated:NO];
}
// */


- (void)viewDidAppear:(BOOL)animated{
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.hidden = NO;
    
    //navBar.frame = CGRectMake(0, -navBar.frame.size.height, navBar.frame.size.width, navBar.frame.size.height);
    //[UIView animateWithDuration:0.1 animations:^{
    //    navBar.frame = CGRectMake(0, 0, navBar.frame.size.width, navBar.frame.size.height);
    //}];
    
    /*
    [self.tableView setContentOffset:CGPointMake(0, self.tableView.contentSize.height-self.tableView.bounds.size.height) animated:YES];
    
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:contenido.count-1 inSection:0] atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    // */
    
    /*
    if (navBar.hidden == NO && !cargo){
        [UIView animateWithDuration:0.1 animations:^{
            self.tableView.frame = CGRectMake(0, navBar.frame.size.height, self.tableView.frame.size.width, self.tableView.frame.size.height);
        }];
    }
    
    if (cargo)
        cargo = NO;
     */
    
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    cargo = YES;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //self.navigationController.navigationBar.hidden = NO;
    
    self.navigationController.navigationBar.hidden = NO;
    
    UINavigationBar *navBar = self.navigationController.navigationBar;
    navBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    navBar.tintColor = [UIColor whiteColor];
    navBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //[navBar setBackIndicatorImage:[UIImage imageNamed:@"02BSuperior02Atrás"]];
    //[navBar setBackIndicatorTransitionMaskImage:[UIImage imageNamed:@"02BSuperior02Atrás"]];
    
    secciones = @[@"Top 10 NMX", @"Top 10 NOM"];
    sSecciones = @[@"NMX",@"NOM"];
    DataExtractor *data = [[DataExtractor alloc] init];
    NMX = [data getTop10NMX];
    NOM = [data getTop10NOM];
    
    
    /*
    allNMX = [data getAllNMX];
    allNOM = [data getAllNOM];
    */
    
    //NSLog(@"allNOM : %d",_allNOM.count);
    
    sNMX = [NSMutableArray array];
    sNOM = [NSMutableArray array];
    
    self.searchBar.delegate = self;
    
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
    if (isSearching)
        return sSecciones[section];
    return secciones[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (!isSearching){
        return 10;
    } else {
        if (section == 0)
            return sNMX.count;
        return sNOM.count;
    }
}

//*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NormaTableViewCell *cell = (NormaTableViewCell*)[tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
    [dateformat setDateFormat:@"YYYY-MM-DD"];
    // Configure the cell...
    if (!isSearching){
        if (indexPath.section == 0){
            Norma *nmx = NMX[indexPath.row];
            cell.clave.text = nmx.clave;
            cell.fecha.text = [dateformat stringFromDate:nmx.fecha];
            cell.descripcion.text = nmx.titulo;
            /*
            UIButton *fav = [UIButton buttonWithType:UIButtonTypeCustom];
            fav.frame = CGRectMake(0, 0, 30, 30);
            
            [fav addTarget:self action:@selector(favMark:) forControlEvents:UIControlEventTouchUpInside];
            
            if (nmx.favorito)
                [fav setImage:[UIImage imageNamed:favorita] forState:UIControlStateNormal];
            else
                [fav setImage:[UIImage imageNamed:noFavorita] forState:UIControlStateNormal];
            cell.accessoryView = fav;
            */
        } else if (indexPath.section == 1){
            Norma *nom = NOM[indexPath.row];
            cell.clave.text = nom.clave;
            cell.fecha.text = [dateformat stringFromDate:nom.fechaEntrada];
            cell.descripcion.text = nom.titulo;
            /*
            UIButton *fav = [UIButton buttonWithType:UIButtonTypeCustom];
            fav.frame = CGRectMake(0, 0, 30, 30);
            
            [fav addTarget:self action:@selector(favMark:) forControlEvents:UIControlEventTouchUpInside];
            
            if (nom.favorito)
                [fav setImage:[UIImage imageNamed:favorita] forState:UIControlStateNormal];
            else
                [fav setImage:[UIImage imageNamed:noFavorita] forState:UIControlStateNormal];
            cell.accessoryView = fav;
            
            if (nom.favorito){
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04FavoritosA"] forState:UIControlStateNormal];
            } else {
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04Favoritos"] forState:UIControlStateNormal];
            }*/
        }
    } else {
        if (indexPath.section == 0){
            Norma *nmx = sNMX[indexPath.row];
            cell.clave.text = nmx.clave;
            cell.fecha.text = [dateformat stringFromDate:nmx.fecha];
            cell.descripcion.text = nmx.titulo;
            /*
            UIButton *fav = [UIButton buttonWithType:UIButtonTypeCustom];
            fav.frame = CGRectMake(0, 0, 30, 30);
            
            [fav addTarget:self action:@selector(favMark:) forControlEvents:UIControlEventTouchUpInside];
            
            if (nmx.favorito)
                [fav setImage:[UIImage imageNamed:favorita] forState:UIControlStateNormal];
            else
                [fav setImage:[UIImage imageNamed:noFavorita] forState:UIControlStateNormal];
            cell.accessoryView = fav;
            *
            if (nmx.favorito){
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04FavoritosA"] forState:UIControlStateNormal];
            } else {
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04Favoritos"] forState:UIControlStateNormal];
            }*/
        } else if (indexPath.section == 1){
            Norma *nom = sNOM[indexPath.row];
            cell.clave.text = nom.clave;
            cell.fecha.text = [dateformat stringFromDate:nom.fechaEntrada];
            cell.descripcion.text = nom.titulo;
            
            /*
            UIButton *fav = [UIButton buttonWithType:UIButtonTypeCustom];
            fav.frame = CGRectMake(0, 0, 30, 30);
            
            [fav addTarget:self action:@selector(favMark:) forControlEvents:UIControlEventTouchUpInside];
            
            if (nom.favorito)
                [fav setImage:[UIImage imageNamed:favorita] forState:UIControlStateNormal];
            else
                [fav setImage:[UIImage imageNamed:noFavorita] forState:UIControlStateNormal];
            cell.accessoryView = fav;
            *
            if (nom.favorito){
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04FavoritosA"] forState:UIControlStateNormal];
            } else {
                [cell.favorite setImage:[UIImage imageNamed:@"01BLateral04Favoritos"] forState:UIControlStateNormal];
            }*/
        }
    }
    
    return cell;
}
//*/

/*
- (void)favMark:(id)sender{
    UIButton *b = (UIButton*)sender;
    NormaTableViewCell *cell = (NormaTableViewCell *)[b superview];
    DataExtractor *data = [[DataExtractor alloc] init];
    if ([cell.clave.text containsString:@"NMX"]){
        Norma *nmx = [data getNmxByKey:cell.clave.text];
        [data setFavorito:!nmx.favorito aNMX:nmx];
        UIButton *fav = (UIButton*)cell.accessoryView;
        if (nmx.favorito)
            [fav setImage:[UIImage imageNamed:favorita] forState:UIControlStateNormal];
        else
            [fav setImage:[UIImage imageNamed:noFavorita] forState:UIControlStateNormal];
    } else {
        Norma *nom = [data getNomByKey:cell.clave.text];
        [data setFavorito:!nom.favorito aNOM:nom];
    }
    //[self.tableView reloadData];
    [self.tableView reloadInputViews];
}
*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.searchBar resignFirstResponder];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    if (isSearching){
        if (indexPath.section == 0)
            selected = sNMX[indexPath.row];
        else
            selected = sNOM[indexPath.row];
    } else {
        if (indexPath.section == 0)
            selected = NMX[indexPath.row];
        else
            selected = NOM[indexPath.row];
    }
    //NSLog(@"Highlight norma %@",selected.clave);
}

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

//*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"toDetailNormaSegue"]){
        DetailNormaViewController *dnvc = (DetailNormaViewController *)segue.destinationViewController;
        dnvc.norma = selected;
    }
}
//*/

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    isSearching = YES;
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    isSearching = NO;
    [searchBar setShowsCancelButton:YES animated:YES];
    [sNMX removeAllObjects];
    [sNOM removeAllObjects];
    if (searchText.length > 0){
        isSearching = YES;
        for (Norma *norma in self.allNMX){
            NSRange rClave = [norma.clave rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rTitulo = [norma.titulo rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rTipo = [norma.tipoNorma rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rProd = [norma.producto rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rae = [norma.RAE rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rCtnn = [norma.CTNN rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rOnn = [norma.ONN rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (rClave.location != NSNotFound || rTitulo.location != NSNotFound || rTipo.location != NSNotFound || rProd.location != NSNotFound || rae.location != NSNotFound || rCtnn.location != NSNotFound || rOnn.location != NSNotFound){
                
                [sNMX addObject:norma];
            }
        }
        
        for (Norma *norma in self.allNOM){
            NSRange rClave = [norma.clave rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rTitulo = [norma.titulo rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rTipo = [norma.tipoNorma rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rInter = [norma.normaInternacional rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rProd = [norma.producto rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rConc = [norma.concordancia rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rRae = [norma.RAE rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rDep = [norma.dependencia rangeOfString:searchText options:NSCaseInsensitiveSearch];
            NSRange rCcnn = [norma.CCNN rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (rClave.location != NSNotFound || rTitulo.location != NSNotFound || rTipo.location != NSNotFound|| rInter.location != NSNotFound|| rProd.location != NSNotFound || rConc.location != NSNotFound || rDep.location != NSNotFound|| rProd.location != NSNotFound || rRae.location != NSNotFound || rCcnn.location != NSNotFound){
                
                [sNOM addObject:norma];
            }
        }
    }
    
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    isSearching = NO;
    [searchBar setShowsCancelButton:NO animated:YES];
    searchBar.text = nil;
    [searchBar resignFirstResponder];
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    isSearching = NO;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
}


- (BOOL)prefersStatusBarHidden{
    return  YES;
}
@end
