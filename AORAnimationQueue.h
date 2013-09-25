//
// Created by mrgerych on 25.09.13.
// Copyright (c) 2013 AppsORama. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface AORAnimationQueue : NSObject

+ (AORAnimationQueue *)instance;

- (void)addToQueueAnimation:(void (^)(void))animation andCompletion:(void (^)(void))completion;

@property NSMutableArray *animations;
@end