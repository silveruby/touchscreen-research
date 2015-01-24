//
//  Prototype1AppDelegate.h
//  Prototype1
//
//  Created by Ruby on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuXMLParser.h"
#import "MenuItem.h"

//@class DirectManipulationViewController;
//@class HomeViewController;
//@class GestureViewController;
//@class MenuXMLParser;

@interface Prototype1AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
	
	//HomeViewController *home_vc;
    //DirectManipulationViewController *directManipulation_vc;
	//GestureViewController *gesture_vc;
	
	//MenuItem *menu;
	
	UINavigationController *navigationController;
}


@property (nonatomic, retain) IBOutlet UIWindow *window;
//@property (nonatomic, retain) IBOutlet HomeViewController *home_vc;
//@property (nonatomic, retain) IBOutlet DirectManipulationViewController *directManipulation_vc;
//@property (nonatomic, retain) IBOutlet GestureViewController *gesture_vc;

//@property (nonatomic, retain) MenuItem *menu;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end

