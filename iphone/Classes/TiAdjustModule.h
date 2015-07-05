/**
 * adjust
 *
 * Created by Manoj Kumar
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "TiModule.h"

@interface TiAdjustModule : TiModule
{
}

@property(nonatomic,readonly) NSString *ENVIRONMENT_SANDBOX;
@property(nonatomic,readonly) NSString *ENVIRONMENT_PRODUCTION;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_VERBOSE;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_DEBUG;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_INFO;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_WARN;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_ERROR;
@property(nonatomic,readonly) NSNumber *LOG_LEVEL_ASSERT;

@end
