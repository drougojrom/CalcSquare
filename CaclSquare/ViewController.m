//
//  ViewController.m
//  CaclSquare
//
//  Created by Roman Ustiantcev on 20/04/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *inputField;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (IBAction)calculateButton:(UIButton *)sender {
    NSLog(@"Calculate Works");
    
    // check if we have a number
    BOOL valid;
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:_inputField.text];
    
    valid = [alphaNums isSupersetOfSet:inStringSet];
    if (valid){
    NSLog(valid ? @"YES" : @"NO");
    
    // create double from inputField, calc sqrt
    int userInput = [self.inputField.text integerValue];
    
    int squareResult = [self calcSquare:userInput];
    
    // make it a NSNumber type, convert into a string and add to resultLabel
    NSNumber *userValue = [NSNumber numberWithInt:squareResult];
    self.resultLabel.text = userValue.stringValue;
    } else {
        return;
    }
}

- (IBAction)resetButton:(UIButton *)sender {
    NSLog(@"Reset Works");
    // reset to initial values
    self.resultLabel.text = @"Результат";
    self.counterLabel.text = @"#";
    self.inputField.text = @"";

    
}
// func for calculating a square

-(int)calcSquare: (int)a
{
    int b = 2;
    int c = a;
    int f = a;
    int resultCount = 0;
    
    for (int i = 1; i<b; i++){
        resultCount++;
        for (int j = 1; j < a; j++){
            c += f;
            resultCount++;
        }
        f=c;
    }
    NSNumber *resultCountNum = [NSNumber numberWithInt:resultCount];
    self.counterLabel.text = resultCountNum.stringValue;
    
    NSLog(@"%d", resultCount);
    return c;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [_inputField setDelegate:self];
}

// hide keyboard by tapping on the screen

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
// hide keyboard by tapping return key
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
// block paste function
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender
{
    if (action == @selector(paste:)){
        return NO;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
