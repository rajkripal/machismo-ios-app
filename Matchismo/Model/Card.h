//
//  Card.h
//  Matchismo
//
//  Created by Raj Kripal on 17/08/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString * contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match:(NSArray *) otherCards;

@end
