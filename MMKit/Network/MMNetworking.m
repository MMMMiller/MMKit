//
//  MMNetworking.m
//  MMKitDemo
//
//  Created by xueMingLuan on 2018/2/28.
//  Copyright © 2018年 mille. All rights reserved.
//

#import "MMNetworking.h"
#import <AFNetworking/AFNetworking.h>

@implementation MMNetworking

+ (void)requestWithRequestSerializerType:(MMRequestSerializerType)requestSerializerType
                       requestMethodType:(MMRequestType)requestMethodType
                                     url:(NSString *)url
                                  params:(NSDictionary *)params
                                complete:(MMRequestCompleteBlock)completionBlock
{
    BOOL isHTTP = requestSerializerType == MMRequestSerializerTypeHTTP;
    AFHTTPSessionManager *manager = isHTTP ? [MMNetworking httpRequestManager] : [MMNetworking jsonRequestManager];
    
    NSString *requestMethodTypeStr = requestMethodType ? @"GET" : @"POST";
    NSURLRequest *URLRequest = [[manager requestSerializer] requestWithMethod:requestMethodTypeStr
                                                                    URLString:url
                                                                   parameters:params
                                                                        error:nil];
    
    //[[NSString alloc] initWithData:URLRequest.HTTPBody encoding:NSUTF8StringEncoding]
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:URLRequest
                                                   uploadProgress:nil
                                                 downloadProgress:nil
                                                completionHandler:^(NSURLResponse * response, id responseObject, NSError * error) {
                                                    [manager invalidateSessionCancelingTasks:NO];
                                                    if (!completionBlock) {
                                                        return ;
                                                    }
                                                    if (responseObject) {
                                                        NSData *data=[NSJSONSerialization dataWithJSONObject:responseObject
                                                                                                     options:0 error:nil];
                                                        NSString *jsonStr=[[NSString alloc]initWithData:data
                                                                                               encoding:NSUTF8StringEncoding];
                                                        if (jsonStr.length < 400) {
                                                            NSLog(@"%@",jsonStr);
                                                        }
                                                    }
                                                    if (completionBlock) {
                                                        completionBlock(responseObject, error);
                                                    }
                                                }];
    
    [dataTask resume];
}

+ (AFHTTPSessionManager *)httpRequestManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*"]];
    serializer.removesKeysWithNullValues = YES;
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return manager;
}

+ (AFHTTPSessionManager *)jsonRequestManager {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    AFJSONResponseSerializer *serializer = [AFJSONResponseSerializer serializer];
    serializer.acceptableContentTypes = [NSSet setWithArray:@[@"application/json", @"text/html", @"text/json", @"text/plain", @"text/javascript", @"text/xml", @"image/*"]];
    serializer.removesKeysWithNullValues = YES;
    manager.responseSerializer = serializer;
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 15.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    return manager;
}

@end
