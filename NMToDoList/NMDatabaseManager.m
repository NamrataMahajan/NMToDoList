//
//  NMDatabaseManager.m
//  NMToDoList
//
//  Created by Namrata on 04/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import "NMDatabaseManager.h"

@implementation NMDatabaseManager
+(instancetype)sharedManager {
    
    static NMDatabaseManager *sharedInstance;
    
    if(sharedInstance == nil) {
        
        sharedInstance = [[NMDatabaseManager alloc]init];
    }
    return sharedInstance;
}
-(NSString *)getDatabasePath {
    
    return [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/Namratamahajan.sqlite"];
}
-(int)executeQuery:(NSString *)query {
    
    int success = 0;
    
    const char *UTFquery = [query UTF8String];
    
    const char *UTFDatabasePath= [[self getDatabasePath]UTF8String];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open(UTFDatabasePath,&myDB)== SQLITE_OK) {
        
        if(sqlite3_prepare_v2(myDB,UTFquery,-1,&statement,NULL) == SQLITE_OK) {
            
              if(sqlite3_step(statement) == SQLITE_DONE) {
                  
                
                success = 1;
              }else {
                  NSLog(@"%s",sqlite3_errmsg(myDB));
              }
        }
        else {
            NSLog(@"%s",sqlite3_errmsg(myDB));
        }
    }
    else {
        NSLog(@"%s",sqlite3_errmsg(myDB));
    }
    
    sqlite3_close(myDB);
    return success;
}
-(NSMutableArray *)getAllTask {
    
    NSMutableArray *myArray = [[NSMutableArray alloc]init];
    
    sqlite3_stmt *statement;
    
    NSString *query = @"SELECT TASK FROM TASK_TABLE";
    
    const char *UTFquery = [query UTF8String];
    const char *UTFDatabasePath = [[self getDatabasePath]UTF8String];
    
    if(sqlite3_open(UTFDatabasePath,&myDB) == SQLITE_OK) {
        
        if(sqlite3_prepare_v2(myDB, UTFquery, -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                const char *taskString = (const char *)sqlite3_column_text(statement, 0);
                
                NSString *task = [NSString stringWithUTF8String:taskString];
                
                [myArray addObject:task];
            }
        }
        else {
            NSLog(@"%s",sqlite3_errmsg(myDB));
        }
        sqlite3_close(myDB);
    }
    else {
        NSLog(@"%s",sqlite3_errmsg(myDB));
    }
    return myArray;
}



@end
