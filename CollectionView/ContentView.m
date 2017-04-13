//
//  ContentView.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "ContentView.h"
#import "ContentCell.h"
@interface ContentView()
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;

@end
@implementation ContentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame collectionViewLayout:self.layout];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self registerClass:[ContentCell class] forCellWithReuseIdentifier:@"ContentCell"];
        self.showsHorizontalScrollIndicator = YES;
        self.showsVerticalScrollIndicator = YES;
        self.pagingEnabled = YES;
    }
    return self;
}

- (UICollectionViewFlowLayout *)layout
{
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        [_layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    }
    return _layout;
}
@end
