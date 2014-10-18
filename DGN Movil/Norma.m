//
//  Norma.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "Norma.h"

@implementation Norma

- (id)initWithKey:(NSString *)clave{
    if (self = [super init]){
        _clave = clave;
    }
    return self;
}

- (id)initWithKey:(NSString *)clave andTitle:(NSString *)titulo{
    if (self = [super init]){
        _clave = clave;
        _titulo = titulo;
    }
    return self;
}

@end
