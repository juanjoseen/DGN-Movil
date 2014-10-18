//
//  Conexion.m
//  DGN Movil
//
//  Created by Juan on 18/10/14.
//  Copyright (c) 2014 AxkanSoftware. All rights reserved.
//

#import "Conexion.h"

@implementation Conexion{
    NSString *nmxPath;
    sqlite3 *NMXdb;
}

+ (NSString*)getPathOf:(NSString*)db{
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *dbPath = [bundlePath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",db]];
    return dbPath;
}

- (id)init{
    if (self = [super init]){
        nmxPath = [Conexion getPathOf:@"catanmx"];
        NMXdb = [self iniDB:nmxPath];
    }
    return self;
}

- (sqlite3 *)iniDB:(NSString*)databasePath{
    
    sqlite3 *db;
    NSFileManager *filemgr = [NSFileManager defaultManager];
    
    if ([filemgr fileExistsAtPath:databasePath] == YES){
        const char *dbpath = [databasePath UTF8String];
        if (sqlite3_open(dbpath, &db) != SQLITE_OK){
            NSLog(@"error al abrir la base de datos %@",databasePath);
        } else {
            return db;
        }
    } else {
        NSLog(@"no se encontro ninguna BD para %@",databasePath);
    }
    return nil;
}

- (NSMutableArray *) execSelect:(NSString *)query{
    sqlite3_stmt *statement;
    NSMutableArray *ar = [[NSMutableArray alloc] initWithCapacity:10];
    if (sqlite3_prepare_v2(NMXdb, [query UTF8String], -1, &statement, NULL) == SQLITE_OK) {
        int columns = sqlite3_column_count(statement);
        while (sqlite3_step(statement) == SQLITE_ROW) {
            for(int i=0; i<columns; i++){
                if (sqlite3_column_text(statement, i) == NULL)
                    [ar addObject:@""];
                else
                    [ar addObject:[NSString stringWithCString:(char *)sqlite3_column_text(statement, i) encoding:NSUTF8StringEncoding]];
            }
        }
    }
    sqlite3_finalize(statement);
    //sqlite3_close(db);
    return ar;
}

- (void)dealloc{
    sqlite3_close(NMXdb);
}

@end

@end
