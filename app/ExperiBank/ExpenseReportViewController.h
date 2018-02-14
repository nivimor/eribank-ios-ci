//
//  ExpenseReportViewController.h
//  ExperiBank
//
//  Created by TechFlitter on 12/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpenseReportViewController : UIViewController
{
    int expenses;
    IBOutlet UITableView *expensesTableView;
    IBOutlet UIBarButtonItem *backButton, *addButton;
}

@end
