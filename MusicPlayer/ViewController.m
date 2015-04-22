//
//  ViewController.m
//  播放器
//
//  Created by tarena3812 on 15/2/26.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()<UIScrollViewDelegate>
{
    UIPageControl *pageCon;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollV;
@property (strong,nonatomic) NSArray *imageNames;

@end

@implementation ViewController

- (NSArray *)imageNames
{
    if (!_imageNames) {
        _imageNames = @[@"Welcome_3.0_1.png",@"Welcome_3.0_2.png",@"Welcome_3.0_3.png",@"Welcome_3.0_4.png",@"Welcome_3.0_5.png"];
    }
    return _imageNames;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.scrollV.contentSize = CGSizeMake(self.scrollV.frame.size.width*self.imageNames.count, self.scrollV.frame.size.height);
    for (NSInteger count = 0; count<self.imageNames.count; count++) {
        NSString *imageName = self.imageNames[count];
        UIImageView *imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        imageV.frame = CGRectMake(self.scrollV.frame.size.width*count, 0, self.scrollV.frame.size.width, self.scrollV.frame.size.height);
        [self.scrollV addSubview:imageV];
    }
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(self.scrollV.frame.size.width*(self.imageNames.count-1), 390, self.scrollV.frame.size.width, 50);
    [button addTarget:self action:@selector(gotoNext) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollV addSubview:button];
    self.scrollV.pagingEnabled = YES;
    self.scrollV.bounces = NO;
    self.scrollV.delegate = self;
    [self.view addSubview:self.scrollV];
    pageCon = [[UIPageControl alloc]initWithFrame:CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 37)];
    pageCon.numberOfPages = 5;
    pageCon.userInteractionEnabled = NO;
    [self.view addSubview:pageCon];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%lf",self.scrollV.contentOffset.x);
    if (self.scrollV.contentOffset.x/self.scrollV.frame.size.width <= 0.5) {
        pageCon.currentPage = 0;
    }else if(self.scrollV.contentOffset.x/self.scrollV.frame.size.width>0.5 && self.scrollV.contentOffset.x/self.scrollV.frame.size.width<=1.5){
        pageCon.currentPage = 1;
    }else if(self.scrollV.contentOffset.x/self.scrollV.frame.size.width>1.5 && self.scrollV.contentOffset.x/self.scrollV.frame.size.width<=2.5){
        pageCon.currentPage = 2;
    }else if (self.scrollV.contentOffset.x/self.scrollV.frame.size.width>2.5 && self.scrollV.contentOffset.x/self.scrollV.frame.size.width<=3.5){
        pageCon.currentPage = 3;
    }else{
        pageCon.currentPage = 4;
    }
}

- (void)gotoNext
{
    UITabBarController *tabBar = [self.storyboard instantiateViewControllerWithIdentifier:@"tabBarVC"];
    
    [self presentViewController:tabBar animated:YES completion:nil];
    NSLog(@"111");
}

@end
