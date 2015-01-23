//
//  TipViewController.m
//  tipit
//
//  Created by Suresh Punukollu on 1/22/15.
//  Copyright (c) 2015 yahoo. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"

@interface TipViewController ()

@property (weak, nonatomic) IBOutlet UITextField *bill;
@property (weak, nonatomic) IBOutlet UILabel *tip;
@property (weak, nonatomic) IBOutlet UILabel *total;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
- (void)updateTotal: (int) index;
- (void)onSettings;

@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Invoke on change of values in view
    [self updateValues];
    
    // Invoke on settings
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettings)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateTotal:self.tipControl.selectedSegmentIndex];
}

- (void)viewWillAppear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"tip"];
    
    self.tipControl.selectedSegmentIndex = defaultTip;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self updateValues];
    NSLog(@"view did appear");
}

- (void)viewWillDisappear:(BOOL)animated {
    // NSLog(@"view will disappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    // NSLog(@"view did disappear");
}

- (void)updateValues {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int defaultTip = [defaults integerForKey:@"tip"];
    
    int selectedTipIndex = 0;
    if (defaultTip >= 0) {
        selectedTipIndex = defaultTip;
    } else {
        selectedTipIndex = self.tipControl.selectedSegmentIndex;
    }
    
    [self updateTotal:selectedTipIndex];
    
}

- (void)updateTotal: (int) index {
    float billAmount = [self.bill.text floatValue];
    NSArray *tipPercentages = @[@(0.1), @(0.15), @(0.2)];
    
    float tipAmount = billAmount * [tipPercentages[index] floatValue];
    
    float totalAmount = billAmount + tipAmount;
    
    self.tip.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.total.text = [NSString stringWithFormat:@"$%0.2f", totalAmount];
}

- (void)onSettings {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

@end
