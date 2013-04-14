//
//  ZBSettingsViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBSettingsViewController.h"

#define ZBUSERNAME_KEY @"USERNAME"

@interface ZBSettingsViewController()
@property (strong, nonatomic) NSString *ZBUsernameString;
@property (strong, nonatomic) NSString *ZBPasswordString;
@property (weak, nonatomic) IBOutlet UITextField *ZBUsernameTextField;

@property (weak, nonatomic) IBOutlet UILabel *ZBUserNameLabel;

@end


@implementation ZBSettingsViewController

- (IBAction)clickUsername:(UITextField *)sender {
    
    self.ZBUsernameString = [[NSString alloc] initWithString: self.ZBUsernameTextField.text];
    self.ZBUserNameLabel.text = self.ZBUsernameString;
    
    [[NSUserDefaults standardUserDefaults] setObject:self.ZBUsernameString  forKey:ZBUSERNAME_KEY ];
    self.ZBUserNameLabel.text = self.ZBUsernameString;
}

- (IBAction)clickPassword:(UITextField *)sender {

    
    
}

- (IBAction)clickUpdate:(UIButton *)sender {
}


- (void)viewDidLoad
{
    [super viewDidLoad];

    NSString *currentUsername = [[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY];
    
  
    
    if (!currentUsername) {self.ZBUserNameLabel.text = @"<unknown>";
        
    } else self.ZBUserNameLabel.text = currentUsername;
}


@end
