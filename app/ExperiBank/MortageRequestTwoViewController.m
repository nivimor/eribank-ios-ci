//
//  MortageRequestTwoViewController.m
//  ExperiBank
//
//  Created by TechFlitter on 11/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import "MortageRequestTwoViewController.h"

@interface MortageRequestTwoViewController ()

@end

@implementation MortageRequestTwoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setAccessibilityLabel:@"mortageRequestTwoView"];
    [optionsTableView setAccessibilityLabel:@"optionsTableView"];
    [backButton setAccessibilityLabel:@"backButton"];
    [saveButton setAccessibilityLabel:@"saveButton"];
    
    loanTypeArray = [NSArray arrayWithObjects:@"Quick", @"Home", @"Car", @"Personal", @"Education", @"Professional", nil];
    loanYearsArray = [NSArray arrayWithObjects:@"1", @"2", @"5", @"10", @"15", @"20", nil];
    occupationArray = [NSArray arrayWithObjects:@"None", @"Private Job", @"Government Job", @"Agricultural", @"Business", @"Housewife", @"Other", nil];
    incomeArray = [NSArray arrayWithObjects:@"500,000", @"1,000,000", @"1,500,000", @"2,000,000", @"2,500,000", @"5,000,000", @"More", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait ||
            interfaceOrientation == UIInterfaceOrientationLandscapeRight ||
            interfaceOrientation == UIInterfaceOrientationLandscapeLeft);
}

- (BOOL)shouldAutorotate {
    return YES;
}

- (IBAction)savePressed:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Type Of Loan";
            break;
        case 1:
            return @"Number Of Years";
            break;
        case 2:
            return @"Type Of Occupation";
            break;
        case 3:
            return @"Yearly Income";
            break;
        default:
            return @"";
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return [loanTypeArray count];
            break;
        case 1:
            return [loanYearsArray count];
            break;
        case 2:
            return [occupationArray count];
            break;
        case 3:
            return [incomeArray count];
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    switch (indexPath.section) {
        case 0:
        {
            cell.textLabel.text = [loanTypeArray objectAtIndex:indexPath.row];
            if (selectedType == indexPath.row)
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                cell.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        case 1:
        {
            cell.textLabel.text = [loanYearsArray objectAtIndex:indexPath.row];
            if (selectedYear == indexPath.row)
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                cell.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        case 2:
        {
            cell.textLabel.text = [occupationArray objectAtIndex:indexPath.row];
            if (selectedIncome == indexPath.row)
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                cell.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        case 3:
        {
            cell.textLabel.text = [incomeArray objectAtIndex:indexPath.row];
            if (selectedIncome == indexPath.row)
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            else
                cell.accessoryType = UITableViewCellAccessoryNone;
        }
            break;
        default:
            break;
    }
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
            selectedType = indexPath.row;
            break;
        case 1:
            selectedYear = indexPath.row;
            break;
        case 2:
            selectedOccupation = indexPath.row;
            break;
        case 3:
            selectedIncome = indexPath.row;
            break;
        default:
            break;
    }
    [tableView reloadData];
}

@end
