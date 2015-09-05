//
//  DependenciasViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "DependenciasViewController.h"
#import "DataExtractor.h"

@interface DependenciasViewController ()

@end

@implementation DependenciasViewController{
    NSString *selected;
    NSMutableArray *resultados;
    NSArray *filtrados;
    BOOL isSearching;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    DataExtractor *data = [[DataExtractor alloc] init];
    resultados = [data getDependencias];
    filtrados = [NSArray array];
    
    isSearching = NO;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    self.searchBar.delegate = self;
    
    selected = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView Methods -

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return isSearching ? filtrados.count : resultados.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    cell.textLabel.text = isSearching ? filtrados[indexPath.row] : resultados[indexPath.row];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = RGB_COLOR(3.0, 93.0, 5.0);
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.searchBar resignFirstResponder];
    selected = isSearching ? filtrados[indexPath.row] : resultados[indexPath.row];
    [self.delegate getDependecy:selected];
}

#pragma mark - SearchBar Methods -

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    isSearching = NO;
    searchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (searchText.length > 0){
        isSearching = YES;
        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
        filtrados = [resultados filteredArrayUsingPredicate:sPredicate];
    }
    [self.tableView reloadData];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}

#pragma mark - Navigation -

- (IBAction)getBack:(id)sender {
    [self.delegate getDependecy:nil];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
