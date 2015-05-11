//
//  ModalViewController.m
//  iWWDC15
//
//  Created by Pierre BLAZQUEZ on 10/05/2015.
//  Copyright (c) 2015 Pierre BLAZQUEZ. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /* Let's tint all the things! */
    self.navigationController.navigationBar.barTintColor = [UIColor darkGrayColor];
    self.navigationController.navigationBar.tintColor = [UIColor orangeColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    /* Don't forget we have been opened */
    if (![[NSUserDefaults standardUserDefaults] boolForKey:kHelpHasBeenOpenedOnce]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:kHelpHasBeenOpenedOnce];
        NSLog(@"%s: Hey BiTCH, I opened the help for you, and I'll even remember that. IM SO COOL", __PRETTY_FUNCTION__);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    /* Goodnight, Grace! */
    [self.navigationController dismissViewControllerAnimated:true completion:nil];
}

@end
