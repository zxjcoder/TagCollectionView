//
//  TableViewLogic.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "TableViewLogic.h"

@implementation TableViewLogic
#pragma mark ----------------- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (!self.dataSource) {
        return [UIFont familyNames].count;
    }
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    NSString *city = self.dataSource[indexPath.row][@"district"];
    if (city != nil && city != NULL && ![city isKindOfClass:[NSNull class]]) {
        cell.textLabel.text = city;
    }
    else
        cell.textLabel.text = @"null";
    return cell;
}

@end
