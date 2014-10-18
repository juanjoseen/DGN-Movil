//
//  Conexion.h
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface Conexion : NSObject

- (id)init;
- (NSArray*) execSelect:(NSString *) query;

@end
