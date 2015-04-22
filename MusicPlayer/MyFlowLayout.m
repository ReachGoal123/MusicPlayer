//
//  MyFlowLayout.m
//  MusicPlayer
//
//  Created by tarena3812 on 15/3/8.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MyFlowLayout.h"

@implementation MyFlowLayout

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.itemSize = CGSizeMake(150, 150);
        self.minimumLineSpacing = 10;
        self.minimumInteritemSpacing = 10;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.sectionInset = UIEdgeInsetsMake(10, 5, 10, 5);
        self.headerReferenceSize = CGSizeMake(320, 150);
    }
    return self;
}

@end
