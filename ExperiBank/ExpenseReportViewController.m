//
//  ExpenseReportViewController.m
//  ExperiBank
//
//  Created by TechFlitter on 12/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import "ExpenseReportViewController.h"

@interface ExpenseReportViewController ()

@end

@implementation ExpenseReportViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        expenses = 2;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[expensesTableView setEditing:YES];
    [expensesTableView setRowHeight:80];
    
    [self.view setAccessibilityLabel:@"expenseReportView"];
    [expensesTableView setAccessibilityLabel:@"expensesTableView"];
    [backButton setAccessibilityLabel:@"backButton"];
    [addButton setAccessibilityLabel:@"addButton"];
    [expensesTableView reloadData];
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

- (IBAction)addPressed:(id)sender
{
    [expensesTableView beginUpdates];
    NSIndexPath *path = [NSIndexPath indexPathForRow:expenses++ inSection:0];
    [expensesTableView insertRowsAtIndexPaths:[NSArray arrayWithObject:path] withRowAnimation:UIViewAnimationCurveEaseIn];
    [expensesTableView endUpdates];
    
    [expensesTableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionBottom animated:YES];
}

- (IBAction)backPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return expenses;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, cell.frame.size.width, 20)];
        [titleLabel setTag:1000];
        [titleLabel setTextColor:[UIColor darkGrayColor]];
        [titleLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:titleLabel];
        
        UILabel *detailLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 30, cell.frame.size.width, 20)];
        [detailLabel setTag:1001];
        [detailLabel setTextColor:[UIColor lightGrayColor]];
        [detailLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:detailLabel];
        
        UILabel *typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 55, cell.frame.size.width, 20)];
        [typeLabel setTag:1002];
        [typeLabel setTextColor:[UIColor lightGrayColor]];
        [typeLabel setBackgroundColor:[UIColor clearColor]];
        [cell.contentView addSubview:typeLabel];
    }
    

    UILabel *titleLabelByTag = (UILabel *)[cell viewWithTag:1000];
    titleLabelByTag.text = [NSString stringWithFormat:@"Expense %d", indexPath.row];
    
    UILabel *detailLabelByTag = (UILabel *)[cell viewWithTag:1001];
    detailLabelByTag.text = @"Detail goes here";
    
    UILabel *typeLabelByTag = (UILabel *)[cell viewWithTag:1002];
    typeLabelByTag.text = @"Type goes here";
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [expensesTableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UIViewAnimationCurveEaseOut];
    expenses--;
    [expensesTableView endUpdates];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
                                            forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [expensesTableView beginUpdates];
    [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UIViewAnimationCurveEaseOut];
    expenses--;
    [expensesTableView endUpdates];
}

@end
