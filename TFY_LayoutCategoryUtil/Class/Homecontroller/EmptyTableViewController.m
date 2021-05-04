//
//  EmptyTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by 田风有 on 2021/3/13.
//  Copyright © 2021 田风有. All rights reserved.
//

#import "EmptyTableViewController.h"

@interface EmptyTableViewController ()<EmptyDataSetSource,EmptyDataSetDelegate>

@end

@implementation EmptyTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tfy_emptyDataSetSource = self;
    self.tableView.tfy_emptyDataSetDelegate = self;
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    return cell;
}

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"bq"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    return [[NSAttributedString alloc] initWithString:@"暂无数据"
                                           attributes:@{
                                               NSForegroundColorAttributeName : UIColor.redColor,
                                               NSFontAttributeName : [UIFont systemFontOfSize:15]
                                           }];
}

@end
