//
//  FirstViewController.m
//  NMToDoList
//
//  Created by Namrata on 04/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import "FirstViewController.h"


@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    allTask = [[NSMutableArray alloc]init];
}

-(void)viewDidAppear:(BOOL)animated {
    
    [self reloadTask];
}

-(void)reloadTask {
    allTask = [[NMDatabaseManager sharedManager]getAllTask];
    if (allTask.count > 0) {
        [self.tableView reloadData];

    }
    else {
    NSLog(@"No TASK Fetched");
}
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return allTask.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    NSString *taskString = [allTask objectAtIndex:indexPath.row];
    NSLog(@"%@",taskString);
    cell.textLabel.text = taskString;
    
    //cell.textLabel.text = [allTask objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Delete");
    
    NSString *task = [allTask objectAtIndex:indexPath.row];
    
    NSString *deleteQuery=[NSString stringWithFormat:@"DELETE FROM TASK_TABLE WHERE TASK_ID ='%@'",task.uppercaseString];
    
    if ([[NMDatabaseManager sharedManager]executeQuery:deleteQuery] == 1) {
        NSLog(@"Sucessfully Deleted");
        [self reloadTask];
    }
    else
    {
        NSLog(@"Failed to delete TASK");
    }
}

@end
