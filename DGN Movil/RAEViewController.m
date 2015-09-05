//
//  RAEViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 04/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "RAEViewController.h"
#import "DataExtractor.h"

@interface RAEViewController ()

@end

@implementation RAEViewController{
    NSArray *sNMX;
    NSArray *sNOM;
    
    NSMutableArray *aNMX;
    NSMutableArray *aNOM;
    
    BOOL isSearching;
    
    NSArray *secciones;
    NSString *selected;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.searchBar.delegate = self;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    
    DataExtractor *data = [[DataExtractor alloc] init];
    aNMX = [data getRaeNMX];
    aNOM = [data getRaeNOM];
    
    sNMX = [NSMutableArray array];
    sNOM = [NSMutableArray array];
    
    isSearching = NO;
    
    secciones = @[@"NMX", @"NOM"];
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
    if (section == 0)
        return isSearching ? sNMX.count : aNMX.count;
    return isSearching ? sNOM.count : aNOM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    
    NSString *text = @"";
    if (indexPath.section == 0)
        text = isSearching ? sNMX[indexPath.row] : aNMX[indexPath.row];
    else
        text = isSearching ? sNOM[indexPath.row] : aNOM[indexPath.row];
    
    cell.textLabel.text = text;
    cell.textLabel.backgroundColor = [UIColor darkGrayColor];
    cell.textLabel.textColor = [UIColor lightGrayColor];
    cell.textLabel.adjustsFontSizeToFitWidth = YES;
    cell.textLabel.numberOfLines = 0;
    //cell.textLabel.minimumFontSize = 9;
    return cell;
}

- (void)tableView:(UITableView *)tableView didHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    cell.backgroundColor = RGB_COLOR(3.0, 93.0, 5.0);
    cell.textLabel.textColor = [UIColor whiteColor];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0)
        selected = isSearching ? sNMX[indexPath.row] : aNMX[indexPath.row];
    else
        selected = isSearching ? sNOM[indexPath.row] : aNOM[indexPath.row];
    
    [self.delegate getRAE:selected];
    
}

#pragma mark - SearchBar Methods -

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    isSearching = NO;
    searchText = [searchText stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (searchText.length > 0){
        isSearching = YES;
        NSPredicate *sPredicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
        sNMX = [aNMX filteredArrayUsingPredicate:sPredicate];
        sNOM = [aNOM filteredArrayUsingPredicate:sPredicate];
    }
    [self.tableView reloadData];
    
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [self.searchBar resignFirstResponder];
}



#pragma mark - Navigation

- (IBAction)getBack:(id)sender {
    [self.delegate getRAE:nil];
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
