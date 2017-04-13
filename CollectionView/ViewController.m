//
//  ViewController.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "ViewController.h"
#import "CategoryLogic.h"
#import "CategoryView.h"
#import "ContentView.h"
#import "ContentLogic.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
@interface ViewController ()<CategoryLogicDelegate,ContentLogicDelegate>
//类目CollectionView
@property (nonatomic,strong) CategoryView *categoryView;
//类目Viwe逻辑
@property (nonatomic,strong) CategoryLogic *cateLogic;
//内容ConllectionView
@property (nonatomic,strong) ContentView *contentView;
//内容逻辑
@property (nonatomic,strong) ContentLogic *contentLogic;

@property (nonatomic,strong)NSMutableArray  *data;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.categoryView];
    [self.view addSubview:self.contentView];
    [self.categoryView selectItemAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:0];
    NSLog(@"%ld",self.contentLogic.currentPage);

    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"area.json" ofType:nil]];

    NSArray *dataArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"%@",dataArray);
    NSMutableArray *temArr = [NSMutableArray array];
    NSMutableArray *total = [NSMutableArray array];
    for (int i = 0 ;i< dataArray.count;i++) {

        [temArr addObject:dataArray[i]];

        if (i%20 == 0) {
            [total addObject:temArr];
            temArr = [NSMutableArray array];
        }
    }
    [total addObject:temArr];

    NSLog(@"");

    self.cateLogic.dataSource = total;
    self.contentLogic.dataSource = total;
    [self.categoryView reloadData];
    [self.contentView reloadData];

}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.categoryView.frame = CGRectMake(0, 20, kWidth, 40);
    self.contentView.frame = CGRectMake(0, 70, kWidth, kHeight - 100);
}

#pragma mark -----------CategoryDelegate
//标签点击
- (void)CategoryButtonDidSelect:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath
{
    [self.categoryView selectItemAtIndexPath:indexPath animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
    [self.contentView scrollToItemAtIndexPath:indexPath atScrollPosition:0 animated:NO];
    NSLog(@"点击了第%ld个button",indexPath.row);
}
#pragma mark ------------ContentDelegate
//内容页滑动
- (void)ContentViewScrollToPage:(int)page
{
    [self.categoryView selectItemAtIndexPath:[NSIndexPath indexPathForRow:page inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionCenteredHorizontally];
}
#pragma mark -----------懒加载
-(CategoryView *)categoryView
{
    if (!_categoryView) {
        _categoryView  = [[CategoryView alloc] initWithFrame:CGRectZero];
        _categoryView.backgroundColor = [UIColor redColor];
        _categoryView.delegate = self.cateLogic;
        _categoryView.dataSource = self.cateLogic;
        _categoryView.clipsToBounds = NO;
    }
    return _categoryView;
}
- (CategoryLogic *)cateLogic
{
    if (!_cateLogic) {
        _cateLogic = [[CategoryLogic alloc] init];
        _cateLogic.delegate = self;
    }
    return _cateLogic;
}

- (ContentView *)contentView
{
    if (!_contentView) {
        _contentView  = [[ContentView alloc] initWithFrame:CGRectZero];
        _contentView.backgroundColor = [UIColor blueColor];
        _contentView.delegate = self.contentLogic;
        _contentView.dataSource = self.contentLogic;
    }
    return _contentView;
}
- (ContentLogic *)contentLogic
{
    if (!_contentLogic) {
        _contentLogic = [[ContentLogic alloc] init];
        _contentLogic.delegate = self;
    }
    return _contentLogic;
}

@end
