//
//  Norma.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Norma : NSObject

@property (nonatomic, retain) NSString *clave;
@property (nonatomic, retain) NSString *titulo;
@property (nonatomic, retain) NSDate *fecha;
@property (nonatomic, retain) NSDate *fechaEntrada;
@property (nonatomic, retain) NSString *tipoNorma;
@property (nonatomic, retain) NSString *normaInternacional;
@property (nonatomic, retain) NSString *producto;
@property (nonatomic, retain) NSString *concordancia;
@property (nonatomic, retain) NSString *RAE;
@property (nonatomic, retain) NSString *dependencia;
@property (nonatomic, retain) NSString *CTNN;
@property (nonatomic, retain) NSString *CCNN;
@property (nonatomic, retain) NSString *ONN;
@property (nonatomic, retain) NSString *documento;
@property (nonatomic, retain) NSString *conteo;
@property (nonatomic) BOOL favorito;

- (id)initWithKey:(NSString*)clave;
- (id)initWithKey:(NSString*)clave andTitle:(NSString*)titulo;

@end
