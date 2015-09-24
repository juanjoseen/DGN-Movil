//
//  Servicio.h
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 24/09/15.
//  Copyright © 2015 AxkanSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Servicio : NSObject

@property (nonatomic) NSInteger id_servicio;

@property (nonatomic, strong) NSString *titulo;

@property (nonatomic, strong) NSString *contenido;

- (id)initWithId:(NSInteger)id_servicio;

@end
