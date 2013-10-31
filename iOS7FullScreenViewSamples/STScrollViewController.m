//
//  STScrollViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/31.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STScrollViewController.h"

@interface STScrollViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation STScrollViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    if (self.navigationController) {
        self.navigationController.toolbarHidden = NO;
    }

    NSLog(@"contentInset:%@", NSStringFromUIEdgeInsets(_textView.contentInset));
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationController.toolbarHidden = YES;
}

@end
