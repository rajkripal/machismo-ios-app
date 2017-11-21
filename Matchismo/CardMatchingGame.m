//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Raj Kripal on 18/09/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray * cards; //of Card
@end

@implementation CardMatchingGame

- (NSMutableArray *) cards {
    
    if(!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype) initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck {
    
    self = [super init]; //super's designated initializer
    
    if(self) {
        for (int i = 0; i < count; i ++) {
            Card * card = [deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    
    return self;
}

- (Card *) cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count] ? self.cards[index] : nil);
}

static const int MATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;

- (void) chooseCardAtIndex:(NSUInteger)index {
    Card * card = [self cardAtIndex:index];
    if(!card.isMatched) {
        if(card.isChosen) {
            card.chosen = NO;
        } else {
            for (Card * otherCard in self.cards) {
                if(otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if(matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        otherCard.matched = YES;
                        card.matched = YES;
                    } else {
                        self.score -= MATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break; //can only choose two cards for now
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}

@end
