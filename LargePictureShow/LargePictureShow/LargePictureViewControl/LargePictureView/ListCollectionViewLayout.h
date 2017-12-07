//
//  ListCollectionViewLayout.h
//  LargePictureShow
//
//  Created by modong on 2017/12/6.
//  Copyright © 2017年 modong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCollectionViewLayout : UICollectionViewFlowLayout

- (instancetype)initWithItemSize:(CGSize)itemSize scrollDirection:(UICollectionViewScrollDirection)scrollDirection sectionInset:(UIEdgeInsets)sectionInset minimumLineSpacing:(CGFloat)minimumLineSpacing;

@end
