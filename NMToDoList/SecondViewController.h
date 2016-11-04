//
//  SecondViewController.h
//  NMToDoList
//
//  Created by Namrata on 04/11/16.
//  Copyright © 2016 Namrata Mahajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NMDatabaseManager.h"

@interface SecondViewController : UIViewController<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UIButton *saveButton;
@property (strong, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)ActionButton:(id)sender;

@end

