//
//  ViewController.m
//  LargePictureShow
//
//  Created by modong on 2017/12/5.
//  Copyright © 2017年 modong. All rights reserved.
//

#import "ViewController.h"
#import "LargePictureViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self addButton];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)addButton
{
    UIButton *pushButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    
    pushButton.backgroundColor = [UIColor redColor];
    [pushButton addTarget:self action:@selector(buttonDone:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:pushButton];
}

- (void)buttonDone:(id)sender
{
    LargePictureViewController *vc = [[LargePictureViewController alloc] init];
    vc.imageUrlArray = @[@"http://a.hiphotos.baidu.com/image/pic/item/8694a4c27d1ed21bae1a320ea76eddc450da3f0d.jpg", @"http://e.hiphotos.baidu.com/image/pic/item/9d82d158ccbf6c813495f539b63eb13532fa4045.jpg", @"http://e.hiphotos.baidu.com/image/pic/item/d31b0ef41bd5ad6ed9a499008bcb39dbb7fd3cfe.jpg", @"http://f.hiphotos.baidu.com/image/pic/item/5882b2b7d0a20cf4ec1a410d7c094b36adaf995e.jpg", @"http://imgsrc.baidu.com/image/c0%3Dshijue1%2C0%2C0%2C294%2C40/sign=1682a2cca76eddc432eabcb851b2dc88/50da81cb39dbb6fd4a10690f0324ab18972b374b.jpg", @"https://car2.autoimg.cn/cardfs/product/g9/M0D/9E/99/1024x0_1_q87_autohomecar__wKgH0FgsAQaAPTp4AAHRPVtiSt8637.jpg", @"http://pic5.photophoto.cn/20071221/0034034827064413_b.jpg", @"https://car3.autoimg.cn/cardfs/product/g4/M12/2F/AB/1024x0_1_q87_autohomecar__wKjB01jISaSAKswVAAcojRZzMuE120.jpg",@"http://pic7.nipic.com/20100520/559805_115200039131_2.jpg", @"https://car3.autoimg.cn/cardfs/product/g20/M07/81/28/1024x0_1_q87_autohomecar__wKjBw1guN9iACEC_AAGYQafI4oY833.jpg", @"https://car3.autoimg.cn/cardfs/product/g14/M0F/93/3C/1024x0_1_q87_autohomecar__wKjByVggFBOAO3NaAAlfdYTJJ3k421.jpg", @"https://car3.autoimg.cn/cardfs/product/g14/M03/8F/5A/1024x0_1_q87_autohomecar__wKgH1VggFBCASe22AA7whUHO4ak222.jpg", @"https://car3.autoimg.cn/cardfs/product/g9/M05/19/E3/1024x0_1_q87_autohomecar__wKgH0Fl5012AOY7KAAftWXCALls110.jpg", @"https://car3.autoimg.cn/cardfs/product/g9/M0F/19/E3/1024x0_1_q87_autohomecar__wKgH0Fl501qAJaO3AAZ4dbBsPgc716.jpg", @"https://car3.autoimg.cn/cardfs/product/g9/M0C/19/E3/1024x0_1_q87_autohomecar__wKgH0Fl501eAKh5UAAan4la7_4E749.jpg", @"https://car2.autoimg.cn/cardfs/product/g9/M0E/14/33/1024x0_1_q87_autohomecar__wKjBzll501SAVA4FAAXga4nNONU699.jpg", @"https://car2.autoimg.cn/cardfs/product/g10/M0D/B2/B3/1024x0_1_q87_autohomecar__wKjBzVnn_weAPU5FAAIInKJI0O8978.jpg"];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
