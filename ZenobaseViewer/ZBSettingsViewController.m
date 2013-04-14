//
//  ZBSettingsViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBSettingsViewController.h"
#import "ZBConnectionDelegate.h"

#define ZBUSERNAME_KEY @"USERNAME"
#define ZBPASSWORD_KEY @"PASSWORD"

@interface ZBSettingsViewController()
@property (strong, nonatomic) NSString *ZBUsernameString;
@property (strong, nonatomic) NSString *ZBPasswordString;
@property (weak, nonatomic) IBOutlet UITextField *ZBUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ZBPasswordTextField;

@property (weak, nonatomic) IBOutlet UILabel *ZBUserNameLabel;

@end


@implementation ZBSettingsViewController

- (IBAction)clickSubmit:(id)sender {
    ZBConnectionDelegate *newConnection = [[ZBConnectionDelegate alloc] init ];
    
    [newConnection getZBAccessTokenForUsername:self.ZBUsernameString withPassword:self.ZBPasswordString];
    self.ZBUserNameLabel.text = [[NSString alloc] initWithString:newConnection.ZBAccessToken];
    
}

- (IBAction)clickUsername:(UITextField *)sender {
    
    self.ZBUsernameString = [[NSString alloc] initWithString: self.ZBUsernameTextField.text];
    self.ZBUserNameLabel.text = self.ZBUsernameString;
    
    [[NSUserDefaults standardUserDefaults] setObject:self.ZBUsernameString  forKey:ZBUSERNAME_KEY ];
    self.ZBUserNameLabel.text = self.ZBUsernameString;
}

- (IBAction)clickPassword:(UITextField *)sender {
    self.ZBPasswordString = [[NSString alloc] initWithString: self.ZBPasswordTextField.text];
   
    
    [[NSUserDefaults standardUserDefaults] setObject:self.ZBPasswordString  forKey:ZBPASSWORD_KEY ];

    
    
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
