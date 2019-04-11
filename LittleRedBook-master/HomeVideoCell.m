//
//  HomeVideoCell.m
//  LittleRedBook-master
//
//  Created by gsf on 2019/4/11.
//  Copyright © 2019 KM. All rights reserved.
//

#import "HomeVideoCell.h"
@interface HomeVideoCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *playNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;



@property (weak, nonatomic) IBOutlet UIImageView *headerView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@end
@implementation HomeVideoCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)setContent:(HomeRecommandModelContent *)content{
    _content = content;
    if (content) {
        _titleLabel.text = content.title;
        VideoInfo *videoInfo =  content.video_detail_info;
        if ([videoInfo.video_watch_count integerValue] > 10000) {
            videoInfo.video_watch_count = [NSString stringWithFormat:@"%ld万次观看",[videoInfo.video_watch_count integerValue] / 10000];
        }
        _playNumberLabel.text = videoInfo.video_watch_count;
        VideoInfoDetal *detail = videoInfo.detail_video_large_image;
        _durationLabel.text = [NSString stringWithFormat:@"%ld秒",content.video_duration];
        [_videoImageView sd_setImageWithURL:[NSURL URLWithString:detail.url]];
    }
}
- (void)setUser:(UserInfo *)user {
    _user = user;
    if (user) {
        _nameLabel.text =user.name;
        _tipLabel.text = user.author_desc;
        [_headerView sd_setImageWithURL:[NSURL URLWithString:user.avatar_url]];
    }
}
@end
