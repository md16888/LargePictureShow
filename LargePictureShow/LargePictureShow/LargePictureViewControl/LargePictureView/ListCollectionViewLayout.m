//
//  ListCollectionViewLayout.m
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "ListCollectionViewLayout.h"

@implementation ListCollectionViewLayout

- (instancetype)initWithItemSize:(CGSize)itemSize scrollDirection:(UICollectionViewScrollDirection)scrollDirection sectionInset:(UIEdgeInsets)sectionInset minimumLineSpacing:(CGFloat)minimumLineSpacing;
{
    if (self = [super init])
    {
        self.itemSize = itemSize;
        self.scrollDirection = scrollDirection;
        self.sectionInset = sectionInset;
        self.minimumLineSpacing = minimumLineSpacing;
    }
    return self;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
    CGRect visibleRect = CGRectMake(self.collectionView.contentOffset.x, self.collectionView.contentOffset.y, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    
    for (UICollectionViewLayoutAttributes *attribute in array)
    {
        CGFloat distance = CGRectGetMidX(visibleRect) - attribute.center.x;
        CGFloat activeDistance = self.itemSize.width;
        if (ABS(distance) < activeDistance)
        {
            CGFloat normalizeDistance = distance / activeDistance;
            CGFloat zoomFactor = 0.5;
            CGFloat zoom = 1 + zoomFactor*(1-ABS(normalizeDistance));
            attribute.transform3D = CATransform3DMakeScale(zoom, zoom, 1.0);
            attribute.zIndex = 1;
        }
    }
    
    return array;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    CGFloat offsetAdjustment = MAXFLOAT;
    CGFloat horizontalCenter = proposedContentOffset.x + (CGRectGetWidth(self.collectionView.bounds) / 2.0);

    CGRect targetRect = CGRectMake(proposedContentOffset.x, 0.0, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    NSArray* array = [super layoutAttributesForElementsInRect:targetRect];
    for (UICollectionViewLayoutAttributes* layoutAttributes in array) {
        CGFloat itemHorizontalCenter = layoutAttributes.center.x;
        if (ABS(itemHorizontalCenter - horizontalCenter) < ABS(offsetAdjustment)) {
            offsetAdjustment = itemHorizontalCenter - horizontalCenter;
        }
    }
    return CGPointMake(proposedContentOffset.x + offsetAdjustment, proposedContentOffset.y);
}



@end
