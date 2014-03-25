//
//  CounterView.h
//  Death Clock
//
//  Created by Raymond Camden on 3/24/14.
//  Copyright (c) 2014 Raymond Camden. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CounterView : UIView

@property (assign, nonatomic) long long int secondsToLive;
@property (nonatomic, weak) NSDate *deathDate;

@end
