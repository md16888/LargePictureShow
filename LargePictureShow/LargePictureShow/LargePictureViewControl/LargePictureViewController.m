//
//  LargePictureViewController.m
//  LargePictureShow
//
//  Created by modong on 2017/12/5.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "LargePictureViewController.h"
#import "LargePictureCollectionView.h"
#import "ListPictureCollectionView.h"

@interface LargePictureViewController ()

@property (nonatomic, strong) LargePictureCollectionView *largePictureCollectView;
@property (nonatomic, strong) ListPictureCollectionView *listPictureCollectionView;

@property (nonatomic, assign) CGFloat bottomHeight;

@end

@implementation LargePictureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor blackColor];
    self.bottomHeight = 50;
    [self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI
{
    [self.view addSubview:self.largePictureCollectView];
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.largePictureCollectView.frame), [UIScreen mainScreen].bounds.size.width, self.bottomHeight)];
    bottomView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bottomView];
    [bottomView addSubview:self.listPictureCollectionView];
    
    __weak typeof(self) weakSelf = self;
    self.largePictureCollectView.didScrollBlock = ^(UICollectionView *scrollView) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        CGPoint offset = scrollView.contentOffset;
        float rate = (strongSelf.listPictureCollectionView.itemWidth+strongSelf.listPictureCollectionView.minLineSpacing)/strongSelf.view.frame.size.width;
        offset.x = rate*offset.x;
        offset.y = strongSelf.listPictureCollectionView.contentOffset.y;
        [strongSelf.listPictureCollectionView setContentOffset:offset animated:YES];
    };
    
    self.listPictureCollectionView.didScrollBlock = ^(NSIndexPath *indexPath) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.largePictureCollectView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    };
}

- (LargePictureCollectionView *)largePictureCollectView
{
    if (!_largePictureCollectView)
    {
        _largePictureCollectView = [[LargePictureCollectionView alloc] initWithFrame:CGRectMake(0, NAV_HEIGHT+STATUS_HEIGHT, self.view.frame.size.width, self.view.frame.size.height-self.bottomHeight-(NAV_HEIGHT+STATUS_HEIGHT))];
        _largePictureCollectView.imageUrlArray = self.imageUrlArray;
        
    }
    return _largePictureCollectView;
}

- (ListPictureCollectionView *)listPictureCollectionView
{
    if (!_listPictureCollectionView)
    {
        _listPictureCollectionView = [[ListPictureCollectionView alloc] initWithFrame:CGRectMake(0, 5, self.view.frame.size.width, self.bottomHeight-10) itemWidth:30 itemHeight:50 minLineSpacing:10];
        _listPictureCollectionView.imageUrlArray = self.imageUrlArray;
    }
    return _listPictureCollectionView;
}





@end
