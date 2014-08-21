//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Chris Gray on 8/10/14.
//  Copyright (c) 2014 Chris Gray. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

//designated initializer
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *) deck;

-(void)chooseCardAtIndex:(NSUInteger)index;
-(Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) NSInteger numCardsToMatch;
@property (nonatomic, readonly) NSString *cardLabel;

@end
