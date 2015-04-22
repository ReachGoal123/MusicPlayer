//
//  MusicTableViewCell.m
//  MusicPlayer
//
//  Created by tarena3812 on 15/3/10.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "MusicTableViewCell.h"
@interface MusicTableViewCell ()

{
    UILabel *nameLabel;
    UIImageView *downImageV;
    UIImageView *hQImageV;
    UILabel *artistLabel;
}

@end
@implementation MusicTableViewCell



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, 232, 32)];
        [self addSubview:nameLabel];
        downImageV = [[UIImageView alloc]initWithFrame:CGRectMake(20, 25, 17, 17)];
        downImageV.image = [UIImage imageNamed:@"online_autosave_finish"];
        [self addSubview:downImageV];
        hQImageV = [[UIImageView alloc]initWithFrame:CGRectMake(40, 25, 17, 17)];
        hQImageV.image = [UIImage imageNamed:@"hq"];
        [self addSubview:hQImageV];
        artistLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 22, 100, 23)];
        artistLabel.textColor = [UIColor lightGrayColor];
        artistLabel.font = [UIFont systemFontOfSize:11];
        [self addSubview:artistLabel];
    }
    return self;
}

- (void)setMusic:(TRMusic *)music
{
    _music = music;
    nameLabel.text = music.name;
    artistLabel.text = music.artist;
    downImageV.hidden = !music.downloaded;
    hQImageV.hidden = !music.highQuality;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat x = downImageV.frame.origin.x;
    if (self.music.downloaded) {
        x += 20;
    }
    if (self.music.highQuality) {
        CGRect rect = hQImageV.frame;
        rect.origin.x = x;
        hQImageV.frame = rect;
        x += 20;
    }
    CGRect frame = artistLabel.frame;
    frame.origin.x = x;
    artistLabel.frame = frame;
//    CGFloat x = 0;
//    if (!self.music.downloaded) {
//        CGRect frameOfHQ = hQImageV.frame;
//        x += 20;
//        frameOfHQ.origin.x -= x;
//        hQImageV.frame = frameOfHQ;
//    }
//    if (!self.music.highQuality) {
//        CGRect frameOfArtist = artistLabel.frame;
//        x += 20;
//        frameOfArtist.origin.x -= x;
//        artistLabel.frame = frameOfArtist;
//    }//重用就会出现问题
}


@end
