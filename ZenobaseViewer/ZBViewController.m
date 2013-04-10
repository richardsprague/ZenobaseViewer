//
//  ZBViewController.m
//  ZenobaseViewer
//
//  Created by Richard Sprague on 4/10/13.
//  Copyright (c) 2013 Richard Sprague. All rights reserved.
//

#import "ZBViewController.h"
#import "Zenobase.h"


@interface ZBViewController ()
@property (weak, nonatomic) IBOutlet UITextView *ZBMainTextView;
@property (strong, nonatomic) Zenobase *myZB;

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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
