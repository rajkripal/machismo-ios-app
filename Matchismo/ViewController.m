//
//  ViewController.m
//  Matchismo
//
//  Created by Raj Kripal on 17/08/16.
//  Copyright © 2016 Raj Kripal. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic) int flipCount;
@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame * game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@end

@implementation ViewController

- (CardMatchingGame *)game {
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                          usingDeck: [self createDeck]];
    return _game;
}

- (Deck *) createDeck {
    return [[PlayingCardDeck alloc] init];
}



- (IBAction)touchCardButton:(UIButton *)sender {
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex: chosenButtonIndex];
    [self updateUI];
}

- (void) updateUI {
    
    for (UIButton * cardButton in self.cardButtons) {
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card * card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle: [self titleForCard: card]
                    forState: UIControlStateNormal];
        [cardButton setBackgroundImage: [self backgroundImageForCard: card]
                              forState: UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
    }
    [self.scoreLabel setText:[NSString stringWithFormat:@"Score: %d", self.game.score]];
    
}

- (NSString *) titleForCard: (Card *) card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard : (Card *) card {
    return  [UIImage imageNamed: card.isChosen ? @"cardfront" : @"cardback"];
}




@end
