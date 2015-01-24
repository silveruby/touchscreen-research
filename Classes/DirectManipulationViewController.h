//
//  Prototype1ViewController.h
//  Prototype1
//
//  Created by Ruby on 2/11/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Foundation/NSXMLParser.h>


@class MenuItem;
@class MenuXMLParser;
@class FliteTTS;

@interface DirectManipulationViewController : UIViewController {
	FliteTTS *fliteEngine;
	//MenuItem *menu;
	MenuItem *currentItem;
	MenuXMLParser *parser; 
	NSDate *start;
	
	IBOutlet UILabel * status;
	IBOutlet UILabel * elapsedTime;
	
}

//@property (nonatomic, retain) IBOutlet UIView* dmView;
//@property (nonatomic, retain) MenuItem *menu;
@property (nonatomic, retain) MenuItem *currentItem;
@property (nonatomic, retain) MenuXMLParser *parser;
//@property (nonatomic, retain) MenuXMLParser *parser;
//@property (nonatomic, retain) NSData *dstart;

- (IBAction)do_btn_up;
- (IBAction)do_btn_down;
- (IBAction)do_btn_left;
- (IBAction)do_btn_right;
- (IBAction)do_btn_select;

@end

