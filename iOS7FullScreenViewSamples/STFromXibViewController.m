//
//  STFromXibViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/30.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STFromXibViewController.h"

@interface STFromXibViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation STFromXibViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"from xib";
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
