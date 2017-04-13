//
//  ContentCell.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "ContentCell.h"
#import "TableViewLogic.h"
@implementation ContentCell
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup
{
    [self.contentView addSubview:self.tableView];
}
- (void)setData:(NSArray *)data
{
    if (_data != data) {
        _data = data;
    }
    self.logic.dataSource = [NSMutableArray arrayWithArray:self.data];
    [self.tableView reloadData];


}
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        _tableView.delegate = self.logic;
        _tableView.dataSource = self.logic;
        
    }
    return _tableView;
}
- (TableViewLogic *)logic
{
    if (!_logic) {
        _logic = [[TableViewLogic alloc] init];

    }
    return _logic;
}
@end
