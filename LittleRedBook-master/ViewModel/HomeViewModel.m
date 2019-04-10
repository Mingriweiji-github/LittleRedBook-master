//
//  HomeViewModel.m
//  LittleRedBook-master
//
//  Created by Seven on 2019/4/10.
//  Copyright © 2019年 KM. All rights reserved.
//

#import "HomeViewModel.h"
@implementation HomeViewModel
/*
 get:https://111.231.179.228/api/sns/v6/homefeed?deviceId=D4FDE4B4-BB62-46FD-9726-B2C80F8101FF&device_fingerprint=201803012326143984e6d57fdbe6c378b0caa1680d951b0104f282fb38b174&device_fingerprint1=201803012326143984e6d57fdbe6c378b0caa1680d951b0104f282fb38b174&lang=zh&note_index=0&num=10&oid=homefeed_recommend&platform=iOS&refresh_type=1&sid=session.1545641552027559431&sign=e103bba3f1a78187282c78cc0f8b76a1&t=1554901167&trace_id=C8812A44-1E28-4877-8C06-9712E1C6826A&use_jpeg=1
 */
+ (void)getHomeListWithURL:(NSString *)urlString Success:(HKResponseSuccess)success failure:(HKResponseFail)failure{
    
    [SBNetwork GETWithURL:urlString parameters:@{} cachePolicy:SBCachePolicyNetworkElseCache callback:^(id responseObject, NSError *error) {
        
        
//        if (!error) {
//            LKHomeModel *model = [LKHomeModel mj_objectWithKeyValues:responseObject];
//            if ( model && model.code == 0) {
//                success(model.data);
//            }
//        }else{
//            failure(responseObject);
//        }
    }];
}


@end
