//
//  STViewController.m
//  iOS7FullScreenViewSamples
//
//  Created by EIMEI on 2013/10/30.
//  Copyright (c) 2013年 stack3. All rights reserved.
//

#import "STMainViewController.h"
#import "STFromStoryboardViewController.h"
#import "STScrollViewController.h"
#import "STFromXibViewController.h"
#import "STRectEdgeNoneViewController.h"

#define _STCellId @"CellId"

typedef enum {
    _STMenuItemIndexFromIndependentStoryboard,
    _STMenuItemIndexFromIndependentStoryboardWithNavigationBar,
    _STMenuItemIndexScrollViewWithNavibarAndToolbar,
    _STMenuItemIndexFromXib,
    _STMenuItemIndexFromXibWithNavigationBar,
    _STMenuItemIndexRectEdgeNone,
    _STMenuItemIndexRectEdgeNoneWithNavigationBar,
} _STMenuItemIndex;

@interface STMainViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *menuItems;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation STMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Menu";

    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:_STCellId];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    
    _menuItems = [NSMutableArray arrayWithCapacity:10];
    [_menuItems addObject:@"from Storyboard"];
    [_menuItems addObject:@"from Storyboard\nwith NavigationBar and Toolbar"];
    [_menuItems addObject:@"ScrollView\nwith NavigationBar and Toolbar"];
    [_menuItems addObject:@"from xib"];
    [_menuItems addObject:@"from xib\nwith NavigationBar and Toolbar"];
    [_menuItems addObject:@"RectEdgeNone"];
    [_menuItems addObject:@"RectEdgeNone\nwith NavigationBar and Toolbar"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [_tableView deselectRowAtIndexPath:_tableView.indexPathForSelectedRow animated:YES];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [_tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    NSString *text = [_menuItems objectAtIndex:indexPath.row];
    cell.textLabel.text = text;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSRange range = [text rangeOfString:@"\n"];
    if (range.length > 0) {
        cell.textLabel.numberOfLines = 0;
        cell.textLabel.lineBreakMode = NSLineBreakByWordWrapping;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == _STMenuItemIndexFromIndependentStoryboard) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"STFromStoryboardViewController" bundle:nil];
        STFromStoryboardViewController *con = [sb instantiateInitialViewController];
        [self presentViewController:con animated:YES completion:nil];
    } else if (indexPath.row == _STMenuItemIndexFromIndependentStoryboardWithNavigationBar) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"STFromStoryboardViewController" bundle:nil];
        STFromStoryboardViewController *con = [sb instantiateInitialViewController];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuItemIndexScrollViewWithNavibarAndToolbar) {
        UIStoryboard *sb = [UIStoryboard storyboardWithName:@"STScrollViewController" bundle:nil];
        STScrollViewController *con = [sb instantiateInitialViewController];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuItemIndexFromXib) {
        STFromXibViewController *con = [[STFromXibViewController alloc] init];
        [self presentViewController:con animated:YES completion:nil];
    } else if (indexPath.row == _STMenuItemIndexFromXibWithNavigationBar) {
        STFromXibViewController *con = [[STFromXibViewController alloc] init];
        [self.navigationController pushViewController:con animated:YES];
    } else if (indexPath.row == _STMenuItemIndexRectEdgeNone) {
        STRectEdgeNoneViewController *con = [[STRectEdgeNoneViewController alloc] init];
        [self presentViewController:con animated:YES completion:nil];
    } else if (indexPath.row == _STMenuItemIndexRectEdgeNoneWithNavigationBar) {
        STRectEdgeNoneViewController *con = [[STRectEdgeNoneViewController alloc] init];
        [self.navigationController pushViewController:con animated:YES];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *text = [_menuItems objectAtIndex:indexPath.row];
    NSRange range = [text rangeOfString:@"\n"];
    if (range.length > 0) {
        return 72;
    } else {
        return 44;
    }
}

@end
