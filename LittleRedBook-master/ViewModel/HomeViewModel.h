//
//  HomeViewModel.h
//  LittleRedBook-master
//
//  Created by Seven on 2019/4/10.
//  Copyright © 2019年 KM. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewModel : NSObject

+ (void)getDataWith:(NSString *)url withSuccess:(YBRequestSuccessBlock)success faliure:(YBRequestFailureBlock)failure;

@end

NS_ASSUME_NONNULL_END
