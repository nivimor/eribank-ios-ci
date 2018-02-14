//
//  MortageRequestTwoViewController.h
//  ExperiBank
//
//  Created by TechFlitter on 11/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortageRequestTwoViewController : UIViewController
{
    int selectedYear;
    int selectedType;
    int selectedOccupation;
    int selectedIncome;
    NSArray *loanYearsArray;
    NSArray *loanTypeArray;
    NSArray *occupationArray;
    NSArray *incomeArray;
    
    IBOutlet UITableView *optionsTableView;
    IBOutlet UIBarButtonItem *backButton, *saveButton;
}

@end
