//
//  TodayViewController.m
//  DGN Widget
//
//  Created by Juan Elias Navarro on 05/11/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController{
    NSArray *topNMX;
    NSArray *topNOM;
}

- (id)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]){
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userDefaultsDidChange:) name:NSUserDefaultsDidChangeNotification object:nil];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.preferredContentSize = CGSizeMake(320, 190);
    [self updateLabels];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)userDefaultsDidChange:(NSNotification *)notification {
    [self updateLabels];
}

- (IBAction)abreNMX:(id)sender {
    if (self.nmxClave.text){
        NSString *urlBase = [NSString stringWithFormat:@"DGNmovil://?tipo=NMX&clave=%@",self.nmxClave.text];
        NSURL *url = [NSURL URLWithString:urlBase];
        [self.extensionContext openURL:url completionHandler:nil];
    }
}

- (IBAction)abreNOM:(id)sender {
    if (self.nomClave.text){
        NSString *urlBase = [NSString stringWithFormat:@"DGNmovil://?tipo=NOM&clave=%@",self.nomClave.text];
        NSURL *url = [NSURL URLWithString:urlBase];
        [self.extensionContext openURL:url completionHandler:nil];
    }
}


- (void)updateLabels{
    NSUserDefaults *sharedDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.axkansoftware.DGNDefaults"];
    NSString *nmx_clave = [sharedDefaults objectForKey:@"nmxClave"];
    NSString *nmx_titulo = [sharedDefaults objectForKey:@"nmxTitulo"];
    if (nmx_clave){
        self.nmxClave.text = nmx_clave;
        self.nmxTitulo.text = nmx_titulo;
    } else {
        self.nmxTitulo.text = @"Aún no hay NMXs seleccionadas como favoritos o no tiene en el Top 20";
    }
    NSString *nom_clave = [sharedDefaults objectForKey:@"nomClave"];
    NSString *nom_titulo = [sharedDefaults objectForKey:@"nomTitulo"];
    if (nom_clave){
        self.nomClave.text = nom_clave;
        self.nomTitulo.text = nom_titulo;
    } else {
        self.nomTitulo.text = @"Aún no hay NOMs seleccionadas como favoritos o no tiene en el Top 20";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData
    
    completionHandler(NCUpdateResultNoData);
}

@end
