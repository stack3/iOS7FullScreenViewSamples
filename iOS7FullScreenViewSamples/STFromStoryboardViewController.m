//
//  STFromStoryboardViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/30.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STFromStoryboardViewController.h"

@interface STFromStoryboardViewController ()

@end

@implementation STFromStoryboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController) {
        self.navigationController.toolbarHidden = NO;
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}

- (IBAction)didTapCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
