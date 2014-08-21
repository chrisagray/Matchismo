//
//  PlayingCard.h
//  Matchismo
//
//  Created by Chris Gray on 8/9/14.
//  Copyright (c) 2014 Chris Gray. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;


+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end