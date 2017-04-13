//
//  TableViewLogic.h
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol TableViewLogicDelegate <NSObject>



@end

@interface TableViewLogic : NSObject<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak)id<TableViewLogicDelegate> delegate;

@property (nonatomic,strong)NSMutableArray *dataSource;

@end
