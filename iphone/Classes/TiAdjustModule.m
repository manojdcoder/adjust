/**
 * adjust
 *
 * Created by Manoj Kumar
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "TiAdjustModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"
#import "Adjust/Adjust.h"

@implementation TiAdjustModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"8cc133d2-7707-48b2-a1bf-2b1cdd3006be";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ti.adjust";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma Public APIs

-(void)init:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary)
    NSDictionary *dictionary = args;
    ADJConfig *adjustConfig = [ADJConfig configWithAppToken:[TiUtils stringValue:[dictionary objectForKey:@"key"]] environment:[TiUtils stringValue:[dictionary objectForKey:@"environment"]]];
    [adjustConfig setLogLevel:[TiUtils intValue:[dictionary objectForKey:@"logLevel"]]];
    [Adjust appDidLaunch:adjustConfig];
}

-(void)trackEvent:(id)args
{
    ENSURE_ARG_COUNT(args, 1);
    NSString *token = nil;
    ENSURE_ARG_AT_INDEX(token, args, 0, NSString);
    ADJEvent *event = [ADJEvent eventWithEventToken:token];
    if([args count] > 1)
    {
        NSDictionary *dictionary = [args objectAtIndex:1];
        for(id key in dictionary)
        {
            [event addCallbackParameter:key value:[dictionary objectForKey:key]];
        }
    }
    [Adjust trackEvent:event];
}

MAKE_SYSTEM_STR(ENVIRONMENT_SANDBOX,ADJEnvironmentSandbox);
MAKE_SYSTEM_STR(ENVIRONMENT_PRODUCTION,ADJEnvironmentProduction);
MAKE_SYSTEM_PROP(LOG_LEVEL_VERBOSE,ADJLogLevelVerbose);
MAKE_SYSTEM_PROP(LOG_LEVEL_DEBUG,ADJLogLevelDebug);
MAKE_SYSTEM_PROP(LOG_LEVEL_INFO,ADJLogLevelInfo);
MAKE_SYSTEM_PROP(LOG_LEVEL_WARN,ADJLogLevelWarn);
MAKE_SYSTEM_PROP(LOG_LEVEL_ERROR,ADJLogLevelError);
MAKE_SYSTEM_PROP(LOG_LEVEL_ASSERT,ADJLogLevelAssert);

@end
