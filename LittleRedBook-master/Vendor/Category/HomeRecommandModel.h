//
//  HomeRecommandModel.h
//  LittleRedBook-master
//
//  Created by gsf on 2019/4/11.
//  Copyright © 2019 KM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class HomeRecommandModelContent,UserInfo,VideoInfo,VideoInfoDetal;

@interface HomeRecommandModel : NSObject
@property (nonatomic , copy) NSString *app_name ;
@property (nonatomic , strong) NSArray<HomeRecommandModelContent *> *data;
@end

@interface HomeRecommandModelContent : NSObject
@property (nonatomic , copy) NSString *abstract ;
@property (nonatomic , copy) NSString *action_extra ;
@property (nonatomic , copy) NSString *aggr_type ;
@property (nonatomic , copy) NSString *allow_download ;
@property (nonatomic , copy) NSString *article_sub_type ;
@property (nonatomic , copy) NSString *article_type ;
@property (nonatomic , copy) NSString *article_url ;
@property (nonatomic , copy) NSString *cell_type ;
@property (nonatomic , copy) NSString *comment_count ;
@property (nonatomic , copy) NSString *digg_count ;
@property (nonatomic , copy) NSString *display_url ;
@property (nonatomic , copy) NSString *media_name ;
@property (nonatomic , copy) NSString *title ;
@property (nonatomic , copy) NSString *source ;
@property (nonatomic , strong) UserInfo *user_info;

@property (nonatomic , assign) NSInteger video_duration ;
@property (nonatomic , copy) NSString *video_id ;
@property (nonatomic , copy) NSString *video_like_count ;
@property (nonatomic , strong) VideoInfo *video_detail_info;
@end

@interface UserInfo : NSObject
@property (nonatomic , copy) NSString *author_desc ;
@property (nonatomic , copy) NSString *avatar_url ;
@property (nonatomic , copy) NSString *description ;
@property (nonatomic , copy) NSString *name ;
@property (nonatomic , copy) NSString *user_id ;
@property (nonatomic , assign) BOOL user_verified;

@end

@interface VideoInfo : NSObject
@property (nonatomic , assign) NSInteger last_play_duration;
@property (nonatomic , assign) NSInteger video_id ;
@property (nonatomic , copy) NSString* video_watch_count ;
@property (nonatomic , strong) VideoInfoDetal *detail_video_large_image;
@end

@interface VideoInfoDetal : NSObject
@property (nonatomic , copy) NSString *url ;
@property (nonatomic , assign) NSInteger height;
@property (nonatomic , assign) NSInteger width;
@end

NS_ASSUME_NONNULL_END
