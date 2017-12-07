//
//  LargePictureCollectionView.m
//  LargePictureShow
//
//  Created by modong on 2017/12/5.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "LargePictureCollectionView.h"
#import "LargePictureCell.h"
#import "UIImageView+WebCache.h"

static NSString *LargePictureCellName = @"LargePictureCell";

@interface LargePictureCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BOOL isViewActive;

@end

@implementation LargePictureCollectionView

- (instancetype)initWithFrame:(CGRect)frame
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    if (self = [super initWithFrame:frame collectionViewLayout:layout])
    {
        self.dataSource = self;
        self.delegate = self;
        self.pagingEnabled = YES;
        self.showsHorizontalScrollIndicator = NO;
        self.isViewActive = NO;
        [self registerClass:[LargePictureCell class] forCellWithReuseIdentifier:LargePictureCellName];
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    self.isViewActive = YES;
    return YES;
}

#pragma mark ---UICollectionViewDataSource---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrlArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LargePictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:LargePictureCellName forIndexPath:indexPath];
    cell.cellLabel.text = [NSString stringWithFormat:@"%ld/%lu", indexPath.item+1, (unsigned long)self.imageUrlArray.count];
    [cell.cellImageView sd_setImageWithURL:self.imageUrlArray[indexPath.item]];
    return cell;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    self.isViewActive = NO;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.isViewActive)
    {
        if (self.didScrollBlock)
        {
            self.didScrollBlock(self);
        }
    }
}

#pragma mark ---UICollectionViewDelegateFlowLayout---
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake([UIScreen mainScreen].bounds.size.width, self.frame.size.height);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return self.minLineSpacing;
}




@end
