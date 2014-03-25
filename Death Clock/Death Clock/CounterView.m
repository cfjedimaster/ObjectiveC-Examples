//
//  CounterView.m
//  Death Clock
//
//  Created by Raymond Camden on 3/24/14.
//  Copyright (c) 2014 Raymond Camden. All rights reserved.
//

#import "CounterView.h"

@interface CounterView()

@property (nonatomic, strong) UILabel *secondLabel;
@property (nonatomic, strong) NSNumberFormatter *nf;
@property (nonatomic, strong) NSDateFormatter *df;
@property (nonatomic, strong) UILabel *dodLabel;
@end

@implementation CounterView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        NSLog(@"Set my seconds to live to %lld", _secondsToLive);
        
        CGRect counterRect = CGRectMake(0, self.bounds.size.height/2-30, self.bounds.size.width, 60);
        
        _secondLabel = [[UILabel alloc] initWithFrame:counterRect];

        //temp
        //_secondLabel.backgroundColor = [UIColor blueColor];

        _secondLabel.textAlignment = NSTextAlignmentCenter;
        
        //Not sure about this one...
        _secondLabel.adjustsFontSizeToFitWidth = YES;
        
        _secondLabel.textColor = [UIColor whiteColor];
        _secondLabel.font = [UIFont fontWithName:@"Verdana" size:34];

        _nf = [[NSNumberFormatter alloc] init];
        [_nf setNumberStyle:NSNumberFormatterDecimalStyle];

        [self addSubview:_secondLabel];

        /*
         This portion handles the top date
         */
        _df = [[NSDateFormatter alloc] init];
        _df.dateStyle = NSDateFormatterFullStyle;
        
        CGRect dodRect = CGRectMake(0, 40, self.bounds.size.width, 60);
        _dodLabel = [[UILabel alloc] initWithFrame:dodRect];

        _dodLabel.textColor = [UIColor whiteColor];
        _dodLabel.textAlignment = NSTextAlignmentCenter;
        _dodLabel.font = [UIFont fontWithName:@"Verdana" size:18];
        _dodLabel.numberOfLines = 0;
        
        [self addSubview:_dodLabel];
        
        //Start a time
        [NSTimer scheduledTimerWithTimeInterval:1
                                         target:self
                                       selector:@selector(updateCounter:)
                                       userInfo:nil
                                        repeats:YES];
        
    }
    return self;
}

- (void)setSecondsToLive:(long long)secondsToLive
{
    NSLog(@"I was called %lld", secondsToLive);
    _secondsToLive = secondsToLive;
    NSLog(@"and i am now %lld", _secondsToLive);
    
    
    [self updateCounter:nil];
}

- (void)setDeathDate:(NSDate *)deathDate
{
    _deathDate = deathDate;

    NSString *initialDod = @"Your Personal Day of Death is\n";
    NSString *dynDod = [_df stringFromDate:_deathDate];
    
    NSString *finalDod = [initialDod stringByAppendingString:dynDod];
    _dodLabel.text = finalDod;
    
}

- (void)updateCounter:(NSTimer *)timer
{
    //NSLog(@"Timer called %lld", _secondsToLive);
    _secondsToLive--;
    
    
    NSNumber *betterNum = [NSNumber numberWithLongLong:_secondsToLive];
    NSString *prettyNumber = [_nf stringFromNumber:betterNum];
    
    
    _secondLabel.text = prettyNumber;

}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    NSLog(@"yes calling drawrect");
}
*/

@end
