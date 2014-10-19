//
//  DataExtractor.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "DataExtractor.h"


@implementation DataExtractor

- (id)init{
    if (self = [super init]){
        base = [[Conexion alloc] init];
    }
    return self;
}

- (NSMutableArray *)getAllNMX{
    
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NMX ORDER BY clave"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=10){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    return all;
}

- (NSMutableArray *)getAllNOM{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NOM ORDER BY clave"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=13){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>8)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
}

- (NSMutableArray *)getTop10NMX{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NMX ORDER BY conteo DESC LIMIT 10"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=10){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *tipoNorma     = [res objectAtIndex:i+3];
        NSString *producto      = [res objectAtIndex:i+4];
        NSString *RAE           = [res objectAtIndex:i+5];
        NSString *CTNN          = [res objectAtIndex:i+6];
        NSString *ONN           = [res objectAtIndex:i+7];
        NSString *documento     = [res objectAtIndex:i+8];
        NSString *conteo        = [res objectAtIndex:i+9];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nmx = [[Norma alloc] initWithKey:clave];
        nmx.titulo      = titulo;
        nmx.fecha       = fecha;
        nmx.tipoNorma   = tipoNorma;
        nmx.producto    = producto;
        nmx.RAE         = RAE;
        nmx.CTNN        = CTNN;
        nmx.ONN         = ONN;
        nmx.documento   = documento;
        nmx.conteo      = conteo;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nmx];
    }
    return all;
}

- (NSMutableArray *)getTop10NOM{
    NSMutableArray *all = nil;
    
    // Ejecucion de consulta a la base de datos
    NSArray *res = [base execSelect:@"SELECT * FROM NOM ORDER BY conteo DESC LIMIT 10"];
    
    // Recorrido de los campos obtenidos de la consulta
    for (int i=0;i<res.count;i+=13){
        // Formateo de fecha
        NSDateFormatter *dateformat=[[NSDateFormatter alloc]init];
        [dateformat setDateFormat:@"YYYY-MM-DD"];
        
        NSDate *fechaVigor = nil;
        
        // Obtencion de datos segun su orden
        NSString *clave         = [res objectAtIndex:i];
        NSString *titulo        = [res objectAtIndex:i+1];
        NSString *publicacion   = [res objectAtIndex:i+2];
        NSString *entrada       = [res objectAtIndex:i+3];
        NSString *tipoNorma     = [res objectAtIndex:i+4];
        NSString *internacional = [res objectAtIndex:i+5];
        NSString *producto      = [res objectAtIndex:i+6];
        NSString *concordancia  = [res objectAtIndex:i+7];
        NSString *RAE           = [res objectAtIndex:i+8];
        NSString *dependencia   = [res objectAtIndex:i+9];
        NSString *CCNN          = [res objectAtIndex:i+10];
        NSString *documento     = [res objectAtIndex:i+11];
        NSString *conteo        = [res objectAtIndex:i+12];
        NSDate *fecha           = [dateformat dateFromString:[publicacion substringToIndex:10]];
        if (entrada && entrada.length>8)
            fechaVigor          = [dateformat dateFromString:[entrada substringToIndex:10]];
        
        // Agrupacion de datos en una sola entidad
        Norma *nom = [[Norma alloc] initWithKey:clave];
        nom.titulo              = titulo;
        nom.fecha               = fecha;
        if (fechaVigor)
            nom.fechaEntrada    = fechaVigor;
        nom.tipoNorma           = tipoNorma;
        nom.normaInternacional  = internacional;
        nom.producto            = producto;
        nom.concordancia        = concordancia;
        nom.RAE                 = RAE;
        nom.dependencia         = dependencia;
        nom.CCNN                = CCNN;
        nom.documento           = documento;
        nom.conteo              = conteo;
        
        // Si aun no se crea el arreglo se crea uno nuevo
        if (!all)
            all = [NSMutableArray array];
        // Llenado del arreglo con todas las normas obtenidas
        [all addObject:nom];
    }
    return all;
}

- (BOOL)incNOM:(Norma *)nom{
    return [base execQuery:[NSString stringWithFormat:@"UPDATE NOM SET conteo=%d WHERE clave='%@'",[nom.conteo integerValue]+1,nom.clave]];
}

- (BOOL)incNMX:(Norma *)nmx{
    return [base execQuery:[NSString stringWithFormat:@"UPDATE NMX SET conteo=%d WHERE clave='%@'",[nmx.conteo integerValue]+1,nmx.clave]];
}

- (NSMutableArray *)getDependencias{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT dependencia FROM NOM"];
    return resultado;
}

- (NSMutableArray *)getRaeNMX{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT rae FROM NMX"];
    return resultado;
}

- (NSMutableArray *)getRaeNOM{
    NSMutableArray *resultado = [NSMutableArray array];
    resultado = (NSMutableArray *)[base execSelect:@"SELECT DISTINCT rae FROM NOM"];
    return resultado;
}



- (Norma *)getNmxByKey:(NSString *)clave{
    Norma *nmx = nil;
    return nmx;
}

- (Norma *)getNomByKey:(NSString *)clave{
    Norma *nom = nil;
    return nom;
}

@end