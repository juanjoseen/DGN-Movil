//
//  RAETableViewController.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "RAETableViewController.h"
#import "DataExtractor.h"

@interface RAETableViewController ()

@end

@implementation RAETableViewController{
    NSMutableArray *sNMX;
    NSMutableArray *sNOM;
    
    NSMutableArray *aNMX;
    NSMutableArray *aNOM;
    
    BOOL isSearching;
    
    NSArray *secciones;
    NSString *selected;
}


- (void)viewDidAppear:(BOOL)animated{
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -_topBar.frame.size.height, _topBar.frame.size.width, _topBar.frame.size.height)];
    [self.view addSubview:_searchBar];
    
    _searchBar.delegate = self;
    
    _searchBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    _searchBar.tintColor = [UIColor whiteColor];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _topBar.barTintColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    _topBar.tintColor = [UIColor whiteColor];
    
    //_searchBar.backgroundColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    DataExtractor *data = [[DataExtractor alloc] init];
    aNMX = [data getRaeNMX];
    aNOM = [data getRaeNOM];
    
    sNMX = [NSMutableArray array];
    sNOM = [NSMutableArray array];
    
    isSearching = NO;
    
    secciones = @[@"NMX", @"NOM"];
    
}

- (IBAction)regresa:(id)sender {
    [self.delegate getRae:selected];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)showSearchBar:(id)sender {
    [UIView animateWithDuration:0.5 animations:^{
        _searchBar.frame = _topBar.frame;
        _topBar.frame = CGRectMake(0, -_topBar.frame.size.height, _topBar.frame.size.width, _topBar.frame.size.height);
    } completion:^(BOOL finished){
        [_searchBar setShowsCancelButton:YES animated:YES];
    }];
}

- (void)hideSearchBar {
    [UIView animateWithDuration:0.5 animations:^{
        _topBar.frame = _searchBar.frame;
        _searchBar.frame = CGRectMake(0, -_searchBar.frame.size.height, _searchBar.frame.size.width, _searchBar.frame.size.height);
    }];
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
    if (!isSearching){
        if (section == 0)
            return aNMX.count;
        return aNOM.count;
    } else {
        if (section == 0)
            return sNMX.count;
        return sNOM.count;
    }
}

//*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (isSearching){
        if (indexPath.section == 0){
            cell.textLabel.text = sNMX[indexPath.row];
        } else {
            cell.textLabel.text = sNOM[indexPath.row];
        }
    } else {
        if (indexPath.section == 0){
            cell.textLabel.text = aNMX[indexPath.row];
        } else {
            cell.textLabel.text = aNOM[indexPath.row];
        }
    }
    
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    
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

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar{
    isSearching = YES;
    //[searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    isSearching = YES;
    [searchBar setShowsCancelButton:YES animated:YES];
    [sNMX removeAllObjects];
    [sNOM removeAllObjects];
    
    //NSLog(@"nmx: %d",aNMX.count);
    
    for (NSString *str in aNMX){
        NSRange range = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if (range.location != NSNotFound){
            [sNMX addObject:str];
        }
    }
    
    for (NSString *str in aNOM){
        NSLog(@"str: %@",str);
        NSRange range = [str rangeOfString:searchText options:NSCaseInsensitiveSearch];
        
        if (range.location != NSNotFound){
            [sNOM addObject:str];
        }
    }
    //NSLog(@"nmx: %d",sNMX.count);
    
    [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    isSearching = NO;
    [searchBar setShowsCancelButton:NO animated:YES];
    searchBar.text = nil;
    [searchBar resignFirstResponder];
    [self hideSearchBar];
    [self.tableView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    isSearching = NO;
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    [self hideSearchBar];
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    cell.textLabel.textColor = [UIColor whiteColor];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(isSearching){
        if (indexPath.section == 0) {
            selected = sNMX[indexPath.row];
        }else{
            selected = sNOM[indexPath.row];
            
        }
        [self hideSearchBar];
        
    }else{
        if (indexPath.section == 0) {
            selected = aNMX[indexPath.row];
        }else{
            selected = aNOM[indexPath.row];
        
        }
    }
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:3.0/255.0 green:93.0/255.0 blue:5.0/255.0 alpha:1.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor darkGrayColor];
    cell.textLabel.textColor = [UIColor lightGrayColor];
}

- (BOOL)prefersStatusBarHidden{
    return  YES;
}


@end
