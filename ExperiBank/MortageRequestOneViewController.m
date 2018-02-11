//
//  MortageRequestOneViewController.m
//  ExperiBank
//
//  Created by TechFlitter on 11/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import "MortageRequestOneViewController.h"
#import "CountryTableViewController.h"
#import "MortageRequestTwoViewController.h"

@interface MortageRequestOneViewController ()

@end

@implementation MortageRequestOneViewController

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
    [self.view setAccessibilityLabel:@"mortageRequestOneView"];
    [scrollView setAccessibilityLabel:@"scrollView"];
    [firstNameTextField setAccessibilityLabel:@"firstNameTextField"];
    [lastNameTextField setAccessibilityLabel:@"lastNameTextField"];
    [ageTextField setAccessibilityLabel:@"ageTextField"];
    [addressOneTextField setAccessibilityLabel:@"addressOneTextField"];
    [addressTwoTextField setAccessibilityLabel:@"addressTwoTextField"];
    [countryTextField setAccessibilityLabel:@"countryTextField"];
    [amountTextField setAccessibilityLabel:@"amountTextField"];
    
    [countryButton setAccessibilityLabel:@"countryButton"];
    [nextButton setAccessibilityLabel:@"nextButton"];
    [cancelButton setAccessibilityLabel:@"cancelButton"];
    
    scrollView.contentSize = self.view.frame.size;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextPressed:(id)sender
{
    MortageRequestTwoViewController *mortageRequestTwoViewController = [[MortageRequestTwoViewController alloc] initWithNibName:@"MortageRequestTwoViewController" bundle:nil];
    [self.navigationController pushViewController:mortageRequestTwoViewController animated:YES];
}

- (IBAction)cancelPressed:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectCountryPressed:(id)sender
{
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [ageTextField resignFirstResponder];
    [addressOneTextField resignFirstResponder];
    [addressTwoTextField resignFirstResponder];
    [countryTextField resignFirstResponder];
    
    CountryTableViewController *countryTableViewController = [[CountryTableViewController alloc] initWithNibName:@"CountryTableViewController" bundle:nil];
    [countryTableViewController setCountryTextField:countryTextField];
    [self presentViewController:countryTableViewController animated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
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

@end
