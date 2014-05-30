//
//  JSVideoFunctions.h
//  JSVideo
//
//  Created by Javier Saiz Hernansanz on 01/05/14.
//  Copyright (c) 2014 Javier Saiz Hernansanz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSVideoFunctions : NSObject


+(NSDictionary *)getUrlInfo;
+(NSString *) getVideoUrl;
+(NSString *) getVideoType;
+(BOOL) getLoopMode;

@end
