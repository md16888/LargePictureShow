//
//  ListPictureCollectionView.m
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "ListPictureCollectionView.h"
#import "ListPictureCell.h"
#import "UIImageView+WebCache.h"
#import "ListCollectionViewLayout.h"

static NSString *ListPictureCellName = @"ListPictureCell";

@interface ListPictureCollectionView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

@property (nonatomic, assign) BOOL isViewActive;

@end

@implementation ListPictureCollectionView

- (CGFloat)itemWidth
{
    if (_itemWidth <= 0)
    {
        _itemWidth = 20;
    }
    
    return _itemWidth;
}

- (CGFloat)itemHeight
{
    if (_itemHeight <= 0)
    {
        _itemHeight = 40;
    }
    
    return _itemHeight;
}

- (instancetype)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth itemHeight:(CGFloat)itemHeight minLineSpacing:(CGFloat)minLineSpacing
{
    ListCollectionViewLayout *layout = [[ListCollectionViewLayout alloc] initWithItemSize:CGSizeMake(itemWidth, itemHeight) scrollDirection:UICollectionViewScrollDirectionHorizontal sectionInset:UIEdgeInsetsMake(0, (frame.size.width-itemWidth)/2, 0, (frame.size.width-itemWidth)/2) minimumLineSpacing:minLineSpacing];
    self = [super initWithFrame:frame collectionViewLayout:layout];
    if (self)
    {
        self.dataSource = self;
        self.delegate = self;
        self.showsHorizontalScrollIndicator = YES;
        self.pagingEnabled = NO;
        
        self.itemWidth = itemWidth;
        self.itemHeight = itemHeight;
        self.minLineSpacing = minLineSpacing;
        
        [self registerClass:[ListPictureCell class] forCellWithReuseIdentifier:ListPictureCellName];
    }
    return self;
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    self.isViewActive = YES;
    return YES;
}

#pragma ---UICollectionViewDataSource---
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageUrlArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    ListPictureCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ListPictureCellName forIndexPath:indexPath];
    
    [cell.cellImageView sd_setImageWithURL:self.imageUrlArray[indexPath.item]];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    
    if (self.didScrollBlock)
    {
        self.didScrollBlock(indexPath);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGPoint point = self.center;
    point.x = point.x + offset.x;
    NSIndexPath *indexPath = [self indexPathForItemAtPoint:point];
    if (self.isViewActive)
    {
        if (self.didScrollBlock)
        {
            self.didScrollBlock(indexPath);
        }
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    //结束滑动时关闭scrollBlock
    self.isViewActive = NO;
}

#pragma mark ---UICollectionViewDelegateFlowLayout---
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    return UIEdgeInsetsMake(0, (self.frame.size.width-self.itemWidth)/2, 0, (self.frame.size.width-self.itemWidth)/2);
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return CGSizeMake(self.itemWidth, self.frame.size.height);
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
//{
//    return self.minLineSpacing;
//}

@end
