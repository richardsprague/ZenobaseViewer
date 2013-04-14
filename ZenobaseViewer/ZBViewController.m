//
//  ZBViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBViewController.h"
#import "Zenobase.h"
#define ZBUSERNAME_KEY @"USERNAME"

@interface ZBViewController ()
@property (weak, nonatomic) IBOutlet UITextView *ZBMainTextView;
@property (strong, nonatomic) Zenobase *myZB;
@property (weak, nonatomic) IBOutlet UILabel *ZBUsernameLabel;

@end

@implementation ZBViewController


// getter for Zenobase *myZB
- (Zenobase *) myZB
{
    if (!_myZB)
    {
        _myZB = [[Zenobase alloc] init];
        
    }
    return self.myZB;
}

- (IBAction)ZBListBucketsClicked:(UIButton *)sender {
    self.ZBMainTextView.text = self.myZB.description;
    
}

- (IBAction)ZBListEventsClicked:(UIButton *)sender {
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:(BOOL)animated];
	// Do any additional setup after loading the view, typically from a nib.
    self.ZBUsernameLabel.text = [[NSString alloc] initWithFormat:@"For user: %@",[[NSUserDefaults standardUserDefaults] stringForKey:ZBUSERNAME_KEY]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
