//
//  CategoryView.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "CategoryView.h"
#import "CategoryCell.h"
@interface CategoryView()
@property (nonatomic,strong)UICollectionViewFlowLayout *layout;
@end
@implementation CategoryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame collectionViewLayout:self.layout];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [self registerClass:[CategoryCell class] forCellWithReuseIdentifier:@"CategoryCell"];
        self.showsHorizontalScrollIndicator = NO;
        self.showsVerticalScrollIndicator = NO;
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
