//
//  NMDatabaseManager.h
//  NMToDoList
//
//  Created by Namrata on 04/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface NMDatabaseManager : NSObject
{
    sqlite3 *myDB;
}
+(instancetype)sharedManager;

-(NSString *)getDatabasePath;

-(int)executeQuery:(NSString *)query;

-(NSMutableArray *)getAllTask;

@end
