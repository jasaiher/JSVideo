//
//  JSVideoFunctions.m
//  JSVideo
//
//  Created by Javier Saiz Hernansanz on 01/05/14.
//  Copyright (c) 2014 Javier Saiz Hernansanz. All rights reserved.
//

#import "JSVideoFunctions.h"
#import "JSConstants.h"

@implementation JSVideoFunctions


#pragma mark - Video URL

+(NSDictionary *)getUrlInfo{
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"JSVideoController-Info" ofType:@"plist"];
    NSDictionary *dict=[NSDictionary dictionaryWithContentsOfFile:plistPath];
    return dict;
}

+(NSString *) getVideoUrl{
    
    NSString *videoUrl;
    
    if (IS_IPHONE_5) {
        videoUrl=[NSString stringWithFormat:@"%@-568h",[[JSVideoFunctions getUrlInfo] objectForKey:@"Video Url"]];
    }else{
        videoUrl = [[JSVideoFunctions getUrlInfo] objectForKey:@"Video Url"];
    }
    
    return videoUrl;
    
}

+(NSString *) getVideoType{
    return [[JSVideoFunctions getUrlInfo] objectForKey:@"Type"];
}

+(BOOL) getLoopMode{
    return [[[JSVideoFunctions getUrlInfo] objectForKey:@"Mode Loop"] boolValue];
}

@end
