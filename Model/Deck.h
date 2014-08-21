//
//  Deck.h
//  Matchismo
//
//  Created by Chris Gray on 8/9/14.
//  Copyright (c) 2014 Chris Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (void)addCard:(Card *)card;

- (Card *)drawRandomCard;

@end