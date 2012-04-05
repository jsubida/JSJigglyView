//
//  JSViewController.m
//  JSJigglyView
//
//  Created by Joseph Subida on 4/5/12.
//  Copyright (c) 2012 CraveIt. All rights reserved.
//

#import "JSViewController.h"

@interface JSViewController ()

@end

@implementation JSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

- (IBAction)startJiggle:(id)sender 
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj respondsToSelector:@selector(setJiggling:)])
            [obj setJiggling:YES];
    }];
}

- (IBAction)stopJiggle:(id)sender 
{
    [self.view.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj respondsToSelector:@selector(setJiggling:)])
            [obj setJiggling:NO];
    }];
}
@end
