//
//  PersonalTableViewController.m
//  TFY_LayoutCategoryUtil
//
//  Created by tiandengyou on 2020/3/30.
//  Copyright © 2020 田风有. All rights reserved.
//

#import "PersonalTableViewController.h"

@interface PersonalTableViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic , strong)UITableView *tableView;
@property (nonatomic , copy)NSArray *titleArr;
@end

@implementation PersonalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
   self.tableView.makeChain
    .addToSuperView(self.view)
    .makeMasonry(^(MASConstraintMaker * _Nonnull make) {
        make.edges.equalTo(self.view).offset(0);
    });
    
    self.titleArr = @[@"提示1",@"提示2",@"提示3",@"提示4",@"提示5",@"提示6",@"提示7"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identifier = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    UITableViewCell *cell = [UITableViewCell tfy_cellFromCodeWithTableView:tableView identifier:identifier];
    
    cell.textLabel.text = self.titleArr[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        [TFY_Utils makeToast:@"安居客改卡号公开解放军金阿奎改回来"];
    } else if (indexPath.row == 1) {
        [TFY_Utils makeToast:@"AGK发不发空间啊" duration:3];
    } else if (indexPath.row == 2) {
        [TFY_Utils makeToast:@"奥科吉不卡级本科" duration:2 position:self.view.center];
    } else if (indexPath.row == 3) {
        [TFY_Utils makeToast:@"阿克苏减肥不开机按本菲卡不扣分吧看不付款祭敖包福卡榜咖啡吧开不开" duration:2 idposition:TFYToastPositionTop];
    } else if (indexPath.row == 4) {
        [TFY_Utils makeToastActivity];
    } else if (indexPath.row == 5) {
        [TFY_Utils hideToast];
    } else if (indexPath.row == 6) {
        [TFY_Utils hideToastActivity];
    }
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.makeChain
        .delegate(self)
        .dataSource(self)
        .backgroundColor(UIColor.whiteColor)
        .rowHeight(50);
    }
    return _tableView;
}

@end
