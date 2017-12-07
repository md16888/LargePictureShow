//
//  LargePictureCollectionView.h
//  LargePictureShow
//
//  Created by modong on 2017/12/5.
//  Copyright © 2017年 modong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^DidScrollBlock)(UICollectionView *scrollView);

@interface LargePictureCollectionView : UICollectionView

@property (nonatomic, strong) NSArray *imageUrlArray;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, assign) CGFloat itemWidth;
@property (nonatomic, assign) CGFloat minLineSpacing;

@property (nonatomic, copy) DidScrollBlock didScrollBlock;


@end
