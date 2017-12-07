//
//  ListPictureCell.m
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "ListPictureCell.h"

@implementation ListPictureCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    [self addSubview:self.cellImageView];
}

- (UIImageView *)cellImageView
{
    if (!_cellImageView)
    {
        _cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _cellImageView.contentMode = UIViewContentModeScaleAspectFit;
        _cellImageView.layer.borderWidth = 0;
    }
    return _cellImageView;
}

@end
