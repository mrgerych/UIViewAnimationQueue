//
// Created by mrgerych on 25.09.13.
// Copyright (c) 2013 AppsORama. All rights reserved.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@interface AORAnimation : NSObject

@property (nonatomic, copy) void (^animation)(void);
@property (nonatomic, copy) void (^completion)(void);

@end