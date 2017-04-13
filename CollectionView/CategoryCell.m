//
//  CategoryCell.m
//  CollectionView
//
//  Created by zxj－mac on 16/9/26.
//  Copyright © 2016年 zxj－mac. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.selected = NO;
        [self.contentView addSubview:self.titleLabel];
//        self.selectedBackgroundView.backgroundColor = [UIColor greenColor];
//        self.contentView.backgroundColor = [UIColor yellowColor];
    }
    return self;
}
- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font =  [UIFont systemFontOfSize:14.0];
        _titleLabel.textAlignment = 1;
        _titleLabel.adjustsFontSizeToFitWidth = YES;
    }
    return _titleLabel;
}
//-(void)setHighlighted:(BOOL)highlighted
//{
//    if (highlighted) {
//        self.contentView.backgroundColor = [UIColor greenColor];
//    }
//    else
//        self.contentView.backgroundColor = [UIColor yellowColor];
//}
- (void)setSelected:(BOOL)selected
{
    if (selected) {
        self.contentView.backgroundColor = [UIColor greenColor];
    }
    else
        self.contentView.backgroundColor = [UIColor purpleColor];
}
@end
