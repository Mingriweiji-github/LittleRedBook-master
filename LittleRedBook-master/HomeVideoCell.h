//
//  HomeVideoCell.h
//  LittleRedBook-master
//
//  Created by gsf on 2019/4/11.
//  Copyright © 2019 KM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeRecommandModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeVideoCell : UITableViewCell
@property (nonatomic , strong) HomeRecommandModelContent *content;
@property (nonatomic , strong) UserInfo *user;
@end

NS_ASSUME_NONNULL_END
