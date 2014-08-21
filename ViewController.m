//
//  ViewController.m
//  Matchismo
//
//  Created by Chris Gray on 8/9/14.
//  Copyright (c) 2014 Chris Gray. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UIButton *dealButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *matchSegment;
@property (weak, nonatomic) IBOutlet UILabel *gameLabel;

@end

@implementation ViewController

- (CardMatchingGame *) game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck:[self createDeck]];
    return _game;
}

- (Deck *) createDeck
{
    return [[PlayingCardDeck alloc] init];
}
            
- (IBAction)touchCardButton:(UIButton *)sender
{
    if (self.matchSegment.userInteractionEnabled) {
        self.matchSegment.userInteractionEnabled = NO;
    }
    NSUInteger chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

- (IBAction)touchMatchSegment:(UISegmentedControl *)sender
{
    [self setCards];
}

- (void)setCards
{
    if (self.matchSegment.selectedSegmentIndex == 0) {
        self.game.numCardsToMatch = 2;
    }
    else {
        self.game.numCardsToMatch = 3;
    }
}

- (IBAction)touchDealButton:(UIButton *)sender
{
    [self newGame];
}

- (void)newGame
{
    self.game = nil;
    [self updateUI];
    [self setCards];
    if (!self.matchSegment.userInteractionEnabled) {
        self.matchSegment.userInteractionEnabled = YES;
    }
}

- (void) updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        NSUInteger cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
        self.gameLabel.text = [NSString stringWithFormat:@"%@", self.game.cardLabel];
    }
}

- (NSString *) titleForCard:(Card *)card
{
    return card.chosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(Card *)card
{
    return [UIImage imageNamed:card.isChosen ? @"cardfront" : @"cardback"];
}


@end
