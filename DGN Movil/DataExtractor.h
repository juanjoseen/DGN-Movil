//
//  DataExtractor.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "Conexion.h"
#import "Norma.h"

@interface DataExtractor : NSObject{
    Conexion *base;
}

- (id)init;

- (NSMutableArray *)getAllNMX;
- (NSMutableArray *)getAllNOM;

- (NSMutableArray *)getTop10NMX;
- (NSMutableArray *)getTop10NOM;

- (Norma *)getNmxByKey:(NSString*)clave;
- (Norma *)getNomByKey:(NSString*)clave;

- (NSMutableArray *)getRaeNOM;
- (NSMutableArray *)getRaeNMX;
- (NSMutableArray *)getDependencias;

- (NSMutableArray *)getFavoritosNMX;
- (NSMutableArray *)getFavoritosNOM;

- (BOOL)setFavorito:(BOOL)favorito aNMX:(Norma *)norma;
- (BOOL)setFavorito:(BOOL)favorito aNOM:(Norma *)norma;

- (NSMutableArray *)buscaNOMPorClave:(NSString *)clave Dependencia:(NSString *)dep Definitiva:(BOOL)def RAE:(NSString *)rae deFecha:(NSDate *)fecha1 hastaFecha:(NSDate *)fecha2;
- (NSMutableArray *)buscaNMXPorClave:(NSString *)clave Dependencia:(NSString *)dep Definitiva:(BOOL)def RAE:(NSString *)rae deFecha:(NSDate *)fecha1 hastaFecha:(NSDate *)fecha2;

@end
