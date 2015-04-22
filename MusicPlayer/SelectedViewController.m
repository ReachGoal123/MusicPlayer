//
//  SelectedViewController.m
//  MusicPlayer
//
//  Created by tarena3812 on 15/3/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "SelectedViewController.h"

@interface SelectedViewController ()
@property (nonatomic, strong)NSMutableArray *kinds;
@property (nonatomic, strong)NSMutableArray *imageNames;
@end

@implementation SelectedViewController

- (NSMutableArray *)kinds
{
    if (!_kinds) {
        NSArray *array = @[@"channel01",@"channel02",@"channel03",@"channel04",@"channel05",@"channel06",@"channel07",@"channel08",@"channel09"];
        _kinds = [NSMutableArray arrayWithArray:array];
    }
    return _kinds;
}

- (NSMutableArray *)imageNames
{
    if (!_imageNames) {
        NSArray *array =@[@"ad01",@"ad02",@"ad03",@"ad04",@"ad05"];
        _imageNames = [NSMutableArray arrayWithArray:array];
    }
    return _imageNames;
}


static NSString * reuseIdentifier = @"cellName";
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createHeaderView];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
}
//单元格头
- (void)createHeaderView
{
    UIScrollView *scrollV = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 150)];
    scrollV.contentSize = CGSizeMake(self.view.bounds.size.width*self.imageNames.count, 150);
    scrollV.pagingEnabled = YES;
    
    for (NSInteger count = 0; count < self.imageNames.count; count++) {
        NSString *imageName = self.imageNames[count];
         UIImageView *headerV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        headerV.frame = CGRectMake(self.view.bounds.size.width*count, 0, self.view.bounds.size.width, 150);
        [scrollV addSubview:headerV];
    }
    [self.collectionView addSubview:scrollV];
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.kinds.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    NSString *imageName = self.kinds[indexPath.row];
    cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
    return cell;
}


@end
