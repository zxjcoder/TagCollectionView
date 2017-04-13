//
//  CategoryLogic.h
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol CategoryLogicDelegate <NSObject>

- (void)CategoryButtonDidSelect:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath;

@end


@interface CategoryLogic : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>

//数据源
@property (nonatomic,strong) NSMutableArray *dataSource;
//代理
@property (nonatomic,weak)id<CategoryLogicDelegate> delegate;
@end
