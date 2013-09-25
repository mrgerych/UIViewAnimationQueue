    
Sample for use it:

    cardView.frame = CGRectMake(272, 233, cardView.width, cardView.height);
    [[AORAnimationQuering instance] addToQuereAnimation:^{
        cardView.frame = CGRectMake(20 + (cardView.width - 15) * (_game.dealerCardsOnDesk.count - 1), 
	self.view.height/2 - 50 - cardView.height, 
	cardView.width,  
	cardView.height);
    } andCompletion:^{
        cardView.cardBack.hidden = YES;
    }];