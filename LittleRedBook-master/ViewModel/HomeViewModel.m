//
//  HomeViewModel.m
//  LittleRedBook-master
//
//  Created by Seven on 2019/4/10.
//  Copyright © 2019年 KM. All rights reserved.
//

#import "HomeViewModel.h"
#import "DefaultServerRequest.h"
#import "HomeRecommandModel.h"

@implementation HomeViewModel

+ (void)getDataWith:(NSString *)url withSuccess:(YBRequestSuccessBlock)success faliure:(YBRequestFailureBlock)failure{
    DefaultServerRequest *request = [DefaultServerRequest new];
    request.requestMethod = YBRequestMethodGET;
    request.requestURI = url;
    __weak typeof(self) weakSelf = self;
    [request startWithSuccess:^(YBNetworkResponse * _Nonnull response) {
        __strong typeof(weakSelf) self = weakSelf;
        if (self == nil) {
            return ;
        }
        NSLog(@"responseObject:%@",response.responseObject);
        HomeRecommandModel *model = [HomeRecommandModel mj_objectWithKeyValues:response.responseObject];
        NSArray *data = model.data;
        NSMutableArray *dataSource = [NSMutableArray array];
        if (data.count) {
            for (NSDictionary *dict in data) {
                NSDictionary *content = [AppUtils parseJSON:dict[@"content"]];
                HomeRecommandModelContent *contentModel = [HomeRecommandModelContent mj_objectWithKeyValues:content];
                [dataSource addObject:contentModel];
            }
        }
        if (dataSource.count) {
            success(dataSource);
        }
    } failure:^(YBNetworkResponse * _Nonnull response) {
        __strong typeof(weakSelf) self = weakSelf;
        if (self == nil) {
            return ;
        }
        NSLog(@"failure:%@",@(response.errorType));
    }];

}

@end
