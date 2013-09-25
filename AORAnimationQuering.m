//
// Created by mrgerych on 25.09.13.
// Copyright (c) 2013 AppsORama. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "AORAnimationQuering.h"
#import "AORAnimation.h"


@implementation AORAnimationQuering {
}
- (id)init {
    self = [super init];
    if (self) {
        _animations = [NSMutableArray new];
    }

    return self;
}

+ (AORAnimationQuering *)instance {
    static AORAnimationQuering *_instance = nil;

    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc] init];
        }
    }
    return _instance;
}
- (void) addToQuereAnimation:(void (^)(void)) animation andCompletion:(void (^)(void))completion{
    @synchronized (self) {
        AORAnimation *aorAnimation = [AORAnimation new];
        aorAnimation.animation = animation;
        aorAnimation.completion = completion;
        aorAnimation.positionInQuea = [self.class instance].animations.count;
        [[self.class instance].animations addObject:aorAnimation];
        NSLog(@"quea %d",[self.class instance].animations.count);
        [self startAnimation:aorAnimation];

    }
}

- (void)startAnimation:(AORAnimation *)aorAnimation {
    if ([[self.class instance].animations indexOfObject:aorAnimation] == 0){
        [UIView animateWithDuration:0.6 animations:aorAnimation.animation completion:^(BOOL finished) {
            NSLog(@"completion %d",aorAnimation.positionInQuea);
            aorAnimation.completion();
            if ([self.class instance].animations.count > aorAnimation.positionInQuea){
                [[self.class instance].animations removeObject:aorAnimation];
                [self startAnimation:[self.class instance].animations.firstObject];
            } else {
                [[self.class instance].animations removeAllObjects];
            }

        }];
    }
}
@end