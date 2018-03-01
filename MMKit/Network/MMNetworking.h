//
//  MMNetworking.h
//  MMKitDemo
//
//  Created by xueMingLuan on 2018/2/28.
//  Copyright © 2018年 mille. All rights reserved.
//

#import <Foundation/Foundation.h>

/** 数据请求回调
 @param responseObject 请求成功时得到的数据
 @param error 请求失败的错误描述
 
 */
typedef void(^MMRequestCompleteBlock)(id responseObject, NSError *error);

/** 请求类型
 
 - MMRequestTypePOST: POST
 - MMRequestTypeGET: GET
 */
typedef NS_ENUM(NSInteger, MMRequestType) {
    MMRequestTypePOST = 0,
    MMRequestTypeGET = 1,
};

typedef NS_ENUM(NSInteger, MMRequestSerializerType) {
    MMRequestSerializerTypeJSON,
    MMRequestSerializerTypeHTTP,
};

@interface MMNetworking : NSObject

/**请求数据
 @param requestMethodType 请求类型POST:GET
 @param url 请求地址
 @param params 请求入参
 @param completionBlock 成功回调
 */
+ (void)requestWithRequestSerializerType:(MMRequestSerializerType)requestSerializerType
                       requestMethodType:(MMRequestType)requestMethodType
                                     url:(NSString *)url
                                  params:(NSDictionary *)params
                                complete:(MMRequestCompleteBlock)completionBlock;

@end
