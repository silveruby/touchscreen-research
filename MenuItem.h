//
//  SelectionXML.h
//  Prototype1
//
//  Created by Ruby on 3/8/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MenuItem : NSObject {
@public
	NSString *label;     
	NSNumber *index; 
	NSMutableArray *items;
	MenuItem * parent;
}

@property (nonatomic, retain) NSString *label;
@property (nonatomic, retain) NSNumber *index;
@property (nonatomic, retain) MenuItem *parent;
@property (nonatomic, retain) NSMutableArray *items;


@end