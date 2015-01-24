//
//  GestureViewController.h
//  Prototype1
//
//  Created by Ruby on 4/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MenuItem;
@class MenuXMLParser;
@class FliteTTS;

@interface GestureViewController : UIViewController {
	//UILongPressGestureRecognizer *longPressGR;
	//UIPanGestureRecognizer *panGR;
	//UIRotationGestureRecognizer *rotationGR;
	//UIPinchGestureRecognizer *pinchGR;
	
	FliteTTS *fliteEngine;
	//MenuItem *menu;
	MenuItem *currentItem;
	MenuXMLParser *parser; 
	NSDate *start;
	
	IBOutlet UILabel * status;
	IBOutlet UILabel * elapsedTime;
}

//@property (nonatomic, retain) UITapGestureRecognizer *tapGR;
//@property (nonatomic, retain) UISwipeGestureRecognizer *swipeUpGR;

@property (nonatomic, retain) MenuItem *currentItem;
@property (nonatomic, retain) MenuXMLParser *parser;
//@property (nonatomic, retain) MenuXMLParser *parser;
//@property (nonatomic, retain) NSData *start;

@end