//
//  Prototype1AppDelegate.m
//  Prototype1
//
//  Created by Ruby on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Prototype1AppDelegate.h"
#import "DirectManipulationViewController.h"
#import "GestureViewController.h"
#import "HomeViewController.h"
//#import "MenuXMLParser.h"
//#import "FliteTTS.h"

@implementation Prototype1AppDelegate;

@synthesize window;
@synthesize navigationController;
//@synthesize home_vc;
//@synthesize directManipulation_vc;
//@synthesize gesture_vc;
//@synthesize menu;

#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions { 
	
	//NSLog(@"awakeFromNib");
	
	// parse menuList.xml
	//NSString *str = @"menuList.xml";
	//menu = [MenuXMLParser doParse:str];
	//NSLog(@"Menu : %@", menu->label);
    
    // Override point for customization after app launch.
	//[self.window addSubview:gesture_vc.view];
    [self.window addSubview:[navigationController view]];
	
	
    [self.window makeKeyAndVisible];
	
	return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
	[navigationController release];
	//[home_vc release];
    //[directManipulation_vc release];
    //[gesture_vc release];    
	//[window release];
    [super dealloc];
}


@end
