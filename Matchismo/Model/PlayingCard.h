//
//  PlayingCard.h
//  Matchismo
//
//  Created by Raj Kripal on 17/08/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSUInteger rank;

+ (NSUInteger) maxRank;
+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;

@end
