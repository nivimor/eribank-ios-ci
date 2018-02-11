//
//  MortageRequestOneViewController.h
//  ExperiBank
//
//  Created by TechFlitter on 11/03/13.
//  Copyright (c) 2013 Experitest. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MortageRequestOneViewController : UIViewController
{
    IBOutlet UIScrollView *scrollView;
    IBOutlet UITextField *firstNameTextField;
    IBOutlet UITextField *lastNameTextField;
    IBOutlet UITextField *ageTextField;
    IBOutlet UITextField *addressOneTextField;
    IBOutlet UITextField *addressTwoTextField;
    IBOutlet UITextField *countryTextField;
    IBOutlet UITextField *amountTextField;
    IBOutlet UIButton *countryButton;
    IBOutlet UIButton *nextButton, *cancelButton;
}

@end
