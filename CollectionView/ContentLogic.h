//
//  ContentLogic.h
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ContentLogicDelegate <NSObject>

//- (void)CategoryButtonDidSelect:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath;

- (void)ContentViewScrollToPage:(int )page;

@end
@interface ContentLogic : NSObject<UICollectionViewDelegate,UICollectionViewDataSource>
//数据源
@property (nonatomic,strong) NSMutableArray *dataSource;
//代理
@property (nonatomic,weak)id<ContentLogicDelegate>  delegate;

//当前页数
@property (nonatomic,assign)NSInteger currentPage;
@end
