//
//  NScrollView.m
//  Restaurant
//
//  Created by TechFlitter on 27/01/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NScrollView.h"

@implementation NScrollView

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.nextResponder touchesBegan:touches withEvent:event];
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.nextResponder touchesMoved:touches withEvent:event];
    [super touchesMoved:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.nextResponder touchesEnded:touches withEvent:event];
    [super touchesEnded:touches withEvent:event];
}

@end
