//
//  ContentLogic.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "ContentLogic.h"
#import "ContentCell.h"
@interface ContentLogic()
@end
@implementation ContentLogic

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
#pragma mark -------------UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (!self.dataSource) {
    return 10;
    }
    return self.dataSource.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];

    ContentCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ContentCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1];

    cell.data = self.dataSource[indexPath.row];
//
//    cell.titleLabel.text = [NSString stringWithFormat:@"第%ld个",indexPath.row];
    return cell;
}

#pragma mark -------------UICollectionViewDelegate

//cell被选择时被调用
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (self.delegate && [self.delegate respondsToSelector:@selector(CategoryButtonDidSelect:indexPath:)]) {
//        [self.delegate CategoryButtonDidSelect:collectionView indexPath:indexPath];
//    }

}
#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    int itemCount = 4;
//    CGFloat itemWidth = (collectionView.bounds.size.width - (itemCount + 1) * 10) / itemCount;
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, collectionView.bounds.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//cell的最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
//cell的最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat pageWidth = scrollView.frame.size.width;
//    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
//
//    NSLog(@"滑动到第%ld页",page);
//}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _currentPage = page;
    if (self.delegate && [self.delegate respondsToSelector:@selector(ContentViewScrollToPage:)]) {
        [self.delegate ContentViewScrollToPage:page];
    }
//    NSLog(@"滑动到第%ld页",page);
}

-(NSInteger)currentPage
{
    if (_currentPage != 0) {
        return _currentPage;
    }
    else
        return 0;
}
@end
