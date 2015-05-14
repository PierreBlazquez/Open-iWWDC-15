//
//  ViewController.m
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 08/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    /* If we need a timer, set it. Else, just do the 'Happening' stuff */
    if ([self determineIfWeNeedATimer]) {
        self.lblYesNo.text = @"NO";
        myMagicTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(myMagicLoop) userInfo:nil repeats:YES];
    }
    else {
        [self itIsHappening];
    }
    
    /* Handle the local notifications */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doTheLocalNotificationDance) name:kNotificationsEnabled object:nil];
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kDidPostLocalNotifications]) {
        [LocalNotificationHelper registerForLocalNotifications];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kDidPostLocalNotifications];
    }
    
    /* This is for debugging purposes ONLY */
    [self _internal_doOurDebugStuff];
    
    /* FIX for malfunctionning gesture recognizers (we do it by code now) */
    [self setMyTapRecognizers];
    
    /* FIX for local notification bug */
    [self fixNotifications];
}

- (void)_internal_doOurDebugStuff {
    /* Not documented. */
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(_internal_tap_1)];
    [tap setNumberOfTapsRequired:1];
    [tap setNumberOfTouchesRequired:3];
    [self.view addGestureRecognizer:tap];
}

- (void)_internal_tap_1 {
    [LocalNotificationHelper _internal_displayNotifications];
    //[LocalNotificationHelper _internal_cancelAllNotifications];
}

- (void)setMyTapRecognizers {
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedOnce)];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapedTwice)];
    [tap1 setNumberOfTapsRequired:1];
    [tap1 setNumberOfTouchesRequired:1];
    [tap2 setNumberOfTapsRequired:1];
    [tap2 setNumberOfTouchesRequired:2];
    [self.view addGestureRecognizer:tap1];
    [self.view addGestureRecognizer:tap2];
    
}


- (void)fixNotifications {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kAreLocalNotificationsFixed]) {
        NSLog(@"%s: OK, my bad, I'm fixing my mistakes right now.", __PRETTY_FUNCTION__);
        areWeInABugFixingContext = YES;
        [LocalNotificationHelper cancelAllNotifications];
        [self doTheLocalNotificationDance];
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kAreLocalNotificationsFixed];
        areWeInABugFixingContext = NO;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    /* If we never opened the help before (typically because it's our first launch) */
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kHelpHasBeenOpenedOnce]) {
        NSLog(@"%s: Alright BiTCH, I'll open the help for you...", __PRETTY_FUNCTION__);
        [self openHelp];
    }
}

- (void)doTheLocalNotificationDance {
    NSLog(@"%s: It's time to DANCE!", __PRETTY_FUNCTION__);
    
    [LocalNotificationHelper cancelAllNotifications];
    
    NSArray *dates = [NotificationHelper getDates];
    NSArray *texts = [NotificationHelper getTexts];
    int c = (int)dates.count;
    
    for (int i = 0; i < c; i++) {
        NSDate *date = [TimeHelper dateFromString:[dates objectAtIndex:i] usingFormat:[NotificationHelper getDateFormat]];
        NSString *text = [texts objectAtIndex:i];
        [LocalNotificationHelper newLocalNotificationForDate:date andText:text withTitle:@"WWDC #SOON"];
    }
    
    dates = nil;
    texts = nil;
    
    UIAlertView *alert;
    
    if (areWeInABugFixingContext) {
        alert = [[UIAlertView alloc] initWithTitle:@"Hey" message:@"We have successfuly applied a fix for the notifications." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    
    else {
        alert = [[UIAlertView alloc] initWithTitle:@"Hey" message:@"We have successfuly registered our notifications. See GitHub for more info." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    }
    
    [alert show];
}

- (void)openHelp {
    /* wow */
    [self presentViewController:[self.storyboard instantiateViewControllerWithIdentifier:@"ModalView"] animated:true completion:nil];
}

- (BOOL)determineIfWeNeedATimer {
    duration = [TimeHelper durationBetween:[NSDate date] and:[TimeHelper dateFromString:kWWDCDate usingFormat:kWWDCDateFormat]];
    if (duration > 0) {
        return YES;
    }
    return NO;
}

- (void)myMagicLoop {
    /* We won't talk shit using NSLog on this loop, we need timers to be efficient. */
    if ([self determineIfWeNeedATimer]) {
        self.lblCountdown.text = [TimeHelper getFormattedStringForDuration:duration];
    }
    else {
        [myMagicTimer invalidate];
        [self itIsHappening];
    }
}

- (void)itIsHappening {
    NSLog(@"%s: It's happening! A-MA-ZING!", __PRETTY_FUNCTION__);
    self.lblCountdown.text = @"Mayas were right, it is happening!";
    self.lblYesNo.text = @"YES";
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    if (motion == UIEventSubtypeMotionShake) {
        NSLog(@"%s: Bruh, don't shake me so hard!", __PRETTY_FUNCTION__);
        [self openHelp];
    }
    else {
        NSLog(@"%s: Go fuck yourself. Kind regards, UNiCORN.", __PRETTY_FUNCTION__);
    }
}

- (void)tapedOnce {
    NSLog(@"%s: I love the way on tap me.", __PRETTY_FUNCTION__);
    UIImage *screen = [ScreenshotHelper snapshot:self.view];
    SLComposeViewController *twitter = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    NSString *text;
    if ([self determineIfWeNeedATimer]) {
        text = [NSString stringWithFormat:@"#WWDC15 kicks off in %@! iWWDC by @pierre_blazquez, source code on GitHub.", self.lblCountdown.text];
    }
    else {
        text = @"#WWDC15 has started! Mayas were right! iWWDC by @pierre_blazquez, source code on GitHub.";
    }
    [twitter setInitialText:text];
    [twitter addImage:screen];
    [twitter addURL:[NSURL URLWithString:kWWDCURL]];
    [self presentViewController:twitter animated:YES completion:nil];
}

- (void)tapedTwice {
    NSLog(@"%s: Oh yeah, you're exciting my pixels!", __PRETTY_FUNCTION__);
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:kWWDCURL]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
