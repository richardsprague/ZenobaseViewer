//
//  ZBSettingsViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/13/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBSettingsViewController.h"


#define ZBUSERNAME_KEY @"USERNAME"
#define ZBPASSWORD_KEY @"PASSWORD"
#define ZBACCESSTOKEN_KEY @"ACCESSTOKEN"
#define ZBCLIENTID_KEY @"CLIENTID"


@interface ZBSettingsViewController()<ZBConnectionProtocol>

@property (strong, nonatomic) NSString *ZBUsernameString;
@property (strong, nonatomic) NSString *ZBPasswordString;

@property (strong, nonatomic) NSString *ZBAccessTokenString;
@property (strong, nonatomic) NSString *ZBClientIDString;

@property (weak, nonatomic) IBOutlet UITextField *ZBUsernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ZBPasswordTextField;
@property (weak, nonatomic) IBOutlet UILabel *ZBAccessTokenLabel;

@property (weak, nonatomic) IBOutlet UILabel *ZBUserNameLabel;

@end


@implementation ZBSettingsViewController

@synthesize ZBJsonReturned = _ZBJsonReturned;

- (void)didReceiveJSON:(NSDictionary*)json
{
    self.ZBAccessTokenString = [json objectForKey:@"access_token"];
    self.ZBClientIDString = [json objectForKey:@"client_id"];
    
    self.ZBAccessTokenLabel.text = self.ZBAccessTokenString;

    [[NSUserDefaults standardUserDefaults] setObject:self.ZBAccessTokenString forKey:ZBACCESSTOKEN_KEY];
    [[NSUserDefaults standardUserDefaults] setObject:self.ZBClientIDString forKey:ZBCLIENTID_KEY];
    
  
    

}

- (IBAction)clickSubmit:(id)sender {
    ZBConnectionDelegate *newConnection = [[ZBConnectionDelegate alloc] init ];
    newConnection.delegate = self;
    
    [newConnection getZBAccessTokenForUsername:self.ZBUsernameString withPassword:self.ZBPasswordString];
    
    NSLog(@"finished submit");
    
  //  self.ZBUserNameLabel.text = [[NSString alloc] initWithString:newConnection.ZBAccessToken];
    
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
    
    // NB: assumes that if there is a valid username, then there's a valid password too.

    NSString *currentUsername = [[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY];
    
  
    
    if (!currentUsername) {self.ZBUserNameLabel.text = @"<unknown>";
        
    } else {
        self.ZBUserNameLabel.text = currentUsername;
        self.ZBUsernameString = [[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY];
        self.ZBPasswordString = [[NSUserDefaults standardUserDefaults] stringForKey:ZBPASSWORD_KEY];
        
        
    }
        
    }


@end
