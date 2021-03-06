//
//  STFromStoryboardViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/30.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STFromStoryboardViewController.h"

@interface STFromStoryboardViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation STFromStoryboardViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"from Storyboard";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController) {
        _closeButton.hidden = YES;
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
