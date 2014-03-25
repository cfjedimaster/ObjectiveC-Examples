//
//  RKCConfigViewController.m
//  Death Clock
//
//  Created by Raymond Camden on 3/24/14.
//  Copyright (c) 2014 Raymond Camden. All rights reserved.
//

#import "RKCConfigViewController.h"
#import "RKCDeathClockViewController.h"

@interface RKCConfigViewController()

@property (nonatomic, weak) IBOutlet UIDatePicker *birthdayPicker;
@property (nonatomic, weak) IBOutlet UIButton *startDeathClock;
@property (nonatomic, strong) NSDate *birthday;

@end

@implementation RKCConfigViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        //check for default
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSDate *defaultBD = [defaults objectForKey:@"Birthday"];
        NSLog(@"%@", defaultBD);
        if(defaultBD) _birthday = defaultBD;
        else _birthday = [[NSDate alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //no times, just m/d/y
    _birthdayPicker.datePickerMode = UIDatePickerModeDate;
    _birthdayPicker.date = _birthday;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //you weren't born in the future
    self.birthdayPicker.maximumDate = [[NSDate alloc] init];
    //set an initial data
    _birthday = [[NSDate alloc] init];
}

- (IBAction)setBirthDay:(id)sender
{
    _birthday = self.birthdayPicker.date;
    NSLog(@"Set bday for %@", self.birthday);

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:_birthday forKey:@"Birthday"];

}

- (IBAction)startDeathClock:(id)sender
{
    NSLog(@"CLICK ME BABY");
    RKCDeathClockViewController *dvc = [[RKCDeathClockViewController alloc] init];
    dvc.birthday = _birthday;
    [self.navigationController pushViewController:dvc animated:YES];
}

@end
