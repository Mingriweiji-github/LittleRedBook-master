//
//  SBNetworking.m
//  HongKZH_IOS
//
//  Created by 随便 on 2019/1/11.
//  Copyright © 2018 随便. All rights reserved.
//

#import "SBNetworking.h"

@interface SBNetworking()


@end


@implementation SBNetworking

#pragma mark - Public

+(void)GET:(NSString *)url params:(NSDictionary *)params
            success:(SBResponseSuccess)success fail:(SBResponseFail)fail{
    
    NSError *error;

    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
 //设置请求时间
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
   
    
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:[Host stringByAppendingString:url] parameters:params error:nil];
    
//    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //FIXME:设置请求超时时间
    req.timeoutInterval = 10.f;
    //传token
    [req setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            if (success) {
                success(nil,responseObject);
            }
            
            NSLog(@"\n Reply URL=%@ \n Response: %@",[Host stringByAppendingString:url], responseObject);
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                //blah blah
            }
            
        } else {
            
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
            
        }
        
    }] resume];

}

+(void)GET:(NSString *)url baseURL:(NSString *)baseUrl params:(NSDictionary *)params
   success:(SBResponseSuccess)success fail:(SBResponseFail)fail{
    
    NSError *error;
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"GET" URLString:[baseUrl stringByAppendingString:url] parameters:params error:nil];
    
//    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //FIXME:设置请求超时时间
        req.timeoutInterval = 10.f;
    //传token
    [req setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            if (success) {
                success(nil,responseObject);
            }
            
            NSLog(@"\n Reply URL=%@ \n Response: %@",[Host stringByAppendingString:url], responseObject);

            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                //blah blah
            }
            
        } else {
            
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
            
        }
        
    }] resume];

}

+(void)POST:(NSString *)url params:(NSDictionary *)params
            success:(SBResponseSuccess)success fail:(SBResponseFail)fail{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:[Host stringByAppendingString:url] parameters:nil error:nil];
    
    
    //    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //FIXME:设置请求超时时间
    req.timeoutInterval = 10.f;
    //传token
    [req setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
//    [req setValue:kUserDefaultsObjectForKey(kToken) forHTTPHeaderField:@"token"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //传json
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        NSLog(@"SBNetworkingError: %@, response:%@, responseObject:%@", error, response, responseObject);
        
        if (!error) {
    
            if (success) {
                success(nil,responseObject);
            }
            NSLog(@"Reply URL=%@ \n Response: %@",[Host stringByAppendingString:url], responseObject);

            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                //blah blah
            }
            
        } else {
            NSLog(@"SBNetworkingError: %@, response:%@, responseObject:%@", error, response, responseObject);
            
        }
        
    }] resume];
    
}

+(void)POST:(NSString *)url baseURL:(NSString *)baseUrl params:(NSDictionary *)params
    success:(SBResponseSuccess)success fail:(SBResponseFail)fail{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSMutableURLRequest *req = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:[baseUrl stringByAppendingString:url] parameters:nil error:nil];
    
    
    //    req.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //FIXME:设置请求超时时间
    req.timeoutInterval = 10.f;
    //传token
    [req setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [req setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //传json
    [req setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    
  
    
    [[manager dataTaskWithRequest:req completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (!error) {
            
            if (success) {
                success(nil,responseObject);
            }
            NSLog(@"\n Reply URL=%@ \n Response: %@",[Host stringByAppendingString:url], responseObject);

            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                //blah blah
            }
            
        } else {
            
            NSLog(@"Error: %@, %@, %@", error, response, responseObject);
            
        }
        
    }] resume];
    
     
}

+(void)uploadWithURL:(NSString *)url
                params:(NSDictionary *)params
                fileData:(NSData *)filedata
                name:(NSString *)name
                fileName:(NSString *)filename
                    mimeType:(NSString *) mimeType
                            progress:(SBProgress)progress
                            success:(SBResponseSuccess)success
                            fail:(SBResponseFail)fail{
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"POST" URLString:[Host stringByAppendingString:url] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:filedata name:name fileName:filename mimeType:@"image/jpeg"];
        
    } error:nil];
    
    request.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //传token
    [request setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //传json
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        //进度
        progress(uploadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            //上传图片失败
            NSLog(@"上传图片失败");
            fail(nil,error);
        }else {
            NSLog(@"上传图片成功");
            success(nil,responseObject);
        }
    }];
    [uploadTask resume];
    
    
    
}


+(void)uploadWithURL:(NSString *)url
                baseURL:(NSString *)baseurl
                    params:(NSDictionary *)params
                    fileData:(NSData *)filedata
                        name:(NSString *)name
                        fileName:(NSString *)filename
                            mimeType:(NSString *) mimeType
                                    progress:(SBProgress)progress
                                        success:(SBResponseSuccess)success
                                        fail:(SBResponseFail)fail{
    
    
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer]multipartFormRequestWithMethod:@"POST" URLString:[Host stringByAppendingString:url] parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        
        [formData appendPartWithFileData:filedata name:name fileName:filename mimeType:@"image/jpeg"];
        
    } error:nil];
    
    request.timeoutInterval= [[[NSUserDefaults standardUserDefaults] valueForKey:@"timeoutInterval"] longValue];
    //传token
    [request setValue:@"eyJ0eXBlIjoiSldUIiwiYWxnIjoiSFMyNTYiLCJ0eXAiOiJKV1QifQ.eyJ1c2VyX2lkIjoiZmMyYTZiMjc4YTNkNDE0MmJhZGRkODg4ZDA1NmQ5MGQiLCJleHAiOjE1NTkzNzAwMTh9.q3eYX1AP6n2BlfwRXsDAMASzkBPMeJShU67bjDawrRM" forHTTPHeaderField:@"token"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //传json
    [request setHTTPBody:[jsonString dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLSessionUploadTask *uploadTask = [manager uploadTaskWithStreamedRequest:request progress:^(NSProgress * _Nonnull uploadProgress) {
        //进度
        progress(uploadProgress);
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
        
        if (error) {
            //上传图片失败
            NSLog(@"上传图片失败");
            fail(nil,error);
        }else {
            NSLog(@"上传图片成功");
            success(nil,responseObject);
        }
    }];
    [uploadTask resume];
 
}


+(NSURLSessionDownloadTask *)downloadWithURL:(NSString *)url
            savePathURL:(NSURL *)fileURL
               progress:(SBProgress )progress
                    success:(void (^)(NSURLResponse *, NSURL *))success
                        fail:(void (^)(NSError *))fail{
    AFHTTPSessionManager *manager = [self managerWithBaseURL:nil sessionConfiguration:YES];
    
    NSURL *urlpath = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:urlpath];
    
     NSURLSessionDownloadTask *downloadtask = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
         progress(downloadProgress);
         
     } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
         
         return [fileURL URLByAppendingPathComponent:[response suggestedFilename]];
     } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
         
         if (error) {
             fail(error);
         }else{
             
             success(response,filePath);
         }
     }];
    
    [downloadtask resume];
    
    return downloadtask;
    
}

#pragma mark - Private

+(AFHTTPSessionManager *)managerWithBaseURL:(NSString *)baseURL  sessionConfiguration:(BOOL)isconfiguration{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFHTTPSessionManager *manager =nil;
    
    NSURL *url = [NSURL URLWithString:baseURL];
    
    if (isconfiguration) {
        
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url sessionConfiguration:configuration];
    }else{
        manager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}


+(id)responseConfiguration:(id)responseObject{
    
    NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    return dic;
    
}








@end
