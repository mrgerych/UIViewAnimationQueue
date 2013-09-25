//
// Created by mrgerych on 25.09.13.
// Copyright (c) 2013 mrgerych. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AORAnimationQueue.h"
#import "AORAnimation.h"


@implementation AORAnimationQueue {
}
- (id)init {
    self = [super init];
    if (self) {
        _animations = [NSMutableArray new];
    }
    return self;
}

+ (AORAnimationQueue *)instance {
    static AORAnimationQueue *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}

- (void)addToQueueAnimation:(void (^)(void))animation andCompletion:(void (^)(void))completion{
    @synchronized (self) {
        AORAnimation *aorAnimation = [AORAnimation new];
        aorAnimation.animation = animation;
        aorAnimation.completion = completion;
        [[self.class instance].animations addObject:aorAnimation];
        [self startAnimation:aorAnimation];

    }
}

- (void)startAnimation:(AORAnimation *)aorAnimation {
    if ([[self.class instance].animations indexOfObject:aorAnimation] == 0){
        [UIView animateWithDuration:0.6 animations:aorAnimation.animation completion:^(BOOL finished) {
            aorAnimation.completion();
            if ([self.class instance].animations.count > 1){
                [[self.class instance].animations removeObject:aorAnimation];
                [self startAnimation:[self.class instance].animations.firstObject];
            } else {
                [[self.class instance].animations removeAllObjects];
            }
        }];
    }
}
@end