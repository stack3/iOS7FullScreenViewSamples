//
//  STRectEdgeNoneViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/31.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STRectEdgeNoneViewController.h"

@interface STRectEdgeNoneViewController ()

@property (weak, nonatomic) IBOutlet UIButton *closeButton;

@end

@implementation STRectEdgeNoneViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.edgesForExtendedLayout = UIRectEdgeNone;
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
    }
}

- (IBAction)didTapCloseButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
