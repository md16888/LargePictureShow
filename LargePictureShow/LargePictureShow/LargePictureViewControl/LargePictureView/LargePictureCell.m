//
//  LargePictureCell.m
//  LargePictureShow
//
//  Created by modong on 2017/12/5.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "LargePictureCell.h"

@interface LargePictureCell ()
@property (nonatomic, assign) CGFloat cellLabelHeight;
@end

@implementation LargePictureCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.cellLabelHeight = 30.0f;
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.cellImageView];
    [self addSubview:self.cellLabel];
}

- (UIImageView *)cellImageView
{
    if (!_cellImageView)
    {
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height - self.cellLabelHeight)];
        _cellImageView.contentMode = UIViewContentModeScaleAspectFit;
        _cellImageView.layer.borderWidth = 0;
    }
    return _cellImageView;
}

- (UILabel *)cellLabel
{
    if (!_cellLabel)
    {
        _cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.cellImageView.frame), self.bounds.size.width, self.cellLabelHeight)];
        _cellLabel.textColor = [UIColor lightGrayColor];
        _cellLabel.textAlignment = NSTextAlignmentCenter;
        _cellLabel.layer.borderWidth = 0;
    }
    return _cellLabel;
}

@end
