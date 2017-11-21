//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Raj Kripal on 18/09/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck*) deck;
- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card*) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
