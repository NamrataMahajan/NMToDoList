//
//  FirstViewController.h
//  NMToDoList
//
//  Created by Namrata on 04/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMDatabaseManager.h"

@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *allTask;
}

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

