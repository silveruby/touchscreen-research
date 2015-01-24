//
//  MenuXMLParser.h
//  Prototype1
//
//  Created by Ruby on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class MenuItem;

@interface MenuXMLParser : NSObject <NSXMLParserDelegate> {
	
	// an ad hoc string to hold element value
	NSMutableString *currentElementValue;

	
	// array of user objects
	// NSMutableArray *menu;
	
	MenuItem *currentItem;
	MenuItem *parentItem;

	MenuItem *menu;	
}

//@property (nonatomic, retain) NSMutableArray *menu;
@property (nonatomic, retain) MenuItem *menu;
@property (nonatomic, retain) MenuItem *currentItem;
@property (nonatomic, retain) MenuItem *parentItem;

- (MenuXMLParser *) initMenuXMLParser;

//- (MenuXMLParser *) initXMLParser;
- (void) addItem:(NSDictionary *)attr;
- (void) doParse:(NSString *)xml;

@end
