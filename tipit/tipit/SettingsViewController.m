//
//  SettingsViewController.m
//  tipit
//
//  Created by Suresh Punukollu on 1/22/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@property (weak, nonatomic) IBOutlet UITextField *alwaysTip;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onSave:(id)sender;
- (void)save;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Settings";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onSave:(id)sender {
    [self.view endEditing:YES];
    [self save];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"tip"];
    
    self.tipControl.selectedSegmentIndex = defaultTip;
    // NSLog(@"view will appear");
}

- (void)viewDidAppear:(BOOL)animated {
    
    NSLog(@"view did appear");
}

- (void)save {
    int selectedTipIndex = self.tipControl.selectedSegmentIndex;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setInteger:selectedTipIndex forKey:@"tip"];
    
    NSLog(@"i am %d", [defaults integerForKey:@"tip"]);
}


@end
