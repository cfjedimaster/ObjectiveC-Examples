//
//  RKCDeathClockViewController.m
//  Death Clock
//
//  Created by Raymond Camden on 3/24/14.
//  Copyright (c) 2014 Raymond Camden. All rights reserved.
//

#import "RKCDeathClockViewController.h"
#import "CounterView.h"

@interface RKCDeathClockViewController()

//@property (nonatomic, weak) IBOutlet UIDatePicker *birthdayPicker;
@property (nonatomic, strong) UIImageView *gearView;
@end

@implementation RKCDeathClockViewController

- (void)loadView
{

    CGRect frame = [UIScreen mainScreen].bounds;
    
    CounterView *cv = [[CounterView alloc] initWithFrame:frame];

    CGRect imageFrame = CGRectMake(frame.size.width-30, frame.size.height-30, 28, 28);
    _gearView = [[UIImageView alloc] initWithFrame:imageFrame];
    UIImage *gear = [UIImage imageNamed:@"icon_1241_white.png"];
    _gearView.image = gear;
    
    [cv addSubview:_gearView];
    
    self.view = cv;
}

- (void)setBirthday:(NSDate *)birthday
{
    NSLog(@"I was passed a birthday: %@", birthday);
    
    //So given I'm X days old, how old am I in seconds?
    long long int secondsAlive = [birthday timeIntervalSinceNow] * -1;
    NSLog(@"I've been alive for %lld seconds", secondsAlive);
    
    //Genderless count based on 75 days
    //double avgSeconds = 75 * 365 * 24 * 60 * 60;
    double avgSeconds = 2365200000;
    
    NSLog(@"Avg seconds is %f", avgSeconds);
    
    long long int timeLeft = MAX(0,avgSeconds - secondsAlive);
    NSLog(@"Time left is %lld", timeLeft);
    [(CounterView *)self.view setSecondsToLive:timeLeft];
    
    NSDate *dod = [[NSDate alloc] initWithTimeIntervalSinceNow:timeLeft];
    [(CounterView *)self.view setDeathDate:dod];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    /*
     This is lame, but this seems to work to see if the touch is in the gear
     */
    CGPoint test = [touch locationInView:_gearView];
    
    if (test.x >= 0 && test.y >= 0)
    {
        //add your code for image touch here
        NSLog(@"touch me");
        [self.navigationController popViewControllerAnimated:NO];
    }

    
}
@end
