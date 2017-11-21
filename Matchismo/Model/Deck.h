//
//  Deck.h
//  Matchismo
//
//  Created by Raj Kripal on 17/08/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void) addCard: (Card *) card atTop: (BOOL) atTop;
- (void) addCard: (Card *) card;
- (Card *) drawRandomCard;

@end
