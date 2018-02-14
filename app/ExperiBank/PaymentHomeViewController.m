//
//  PaymentHomeViewController.m
//  ExperiBank
//
//  Created by TechFlitter on 01/01/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import "PaymentHomeViewController.h"
#import "MakePaymentViewController.h"
#import "MortageRequestOneViewController.h"
#import "ExpenseReportViewController.h"

@interface PaymentHomeViewController ()

@end

@implementation PaymentHomeViewController

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
    
    [self.view setAccessibilityLabel:@"paymentHomeView"];
    [scrollView setAccessibilityLabel:@"scrollView"];
    [makePaymentButton setAccessibilityLabel:@"makePaymentButton"];
    [balanceWebView setAccessibilityLabel:@"balanceWebView"];
    [logoutButton setAccessibilityLabel:@"logoutButton"];
    
    scrollView.contentSize = self.view.frame.size;
}

- (void)viewDidUnload
{
    balanceWebView = nil;
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    NSString *html = [NSString stringWithFormat:@"<html><body><h1 align='center'>Your balance is: <br/> %02.02f$ </h1></body></html>",
                      [[NSUserDefaults standardUserDefaults] floatForKey:@"Balance"]];
    [balanceWebView loadHTMLString:html baseURL:nil];
}

- (IBAction)makePaymentPressed:(id)sender
{
    MakePaymentViewController *makePaymentViewController = [[MakePaymentViewController alloc]
                                                            initWithNibName:@"MakePaymentViewController" bundle:nil];
    [self.navigationController pushViewController:makePaymentViewController animated:YES];
}

- (IBAction)mortageRequestPressed:(id)sender
{
    MortageRequestOneViewController *mortageRequestOneViewController = [[MortageRequestOneViewController alloc] initWithNibName:@"MortageRequestOneViewController" bundle:nil];
    [self.navigationController pushViewController:mortageRequestOneViewController animated:YES];
}

- (IBAction)expenseReportPressed:(id)sender
{
    ExpenseReportViewController *expenseReportViewController = [[ExpenseReportViewController alloc] initWithNibName:@"ExpenseReportViewController" bundle:nil];
    [self.navigationController pushViewController:expenseReportViewController animated:YES];
}

- (IBAction)singoutPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
