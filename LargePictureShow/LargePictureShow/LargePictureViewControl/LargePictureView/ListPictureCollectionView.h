//
//  ListPictureCollectionView.h
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^IndexScrollBlock)(NSIndexPath *indexPath);

@interface ListPictureCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *imageUrlArray;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat itemHeight;
@property (nonatomic, assign) CGFloat minLineSpacing;

@property (nonatomic, copy) IndexScrollBlock didScrollBlock;

- (instancetype)initWithFrame:(CGRect)frame itemWidth:(CGFloat)itemWidth itemHeight:(CGFloat)itemHeight minLineSpacing:(CGFloat)minLineSpacing;

@end
