//
//  ContentCell.h
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TableViewLogic;
@interface ContentCell : UICollectionViewCell

@property (nonatomic,strong)UITableView *tableView;

@property (nonatomic,strong)TableViewLogic *logic;


@property (nonatomic,strong)NSArray *data;
@end
