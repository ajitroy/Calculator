//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Intuit Admin on 13/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"
@interface CalculatorViewController ()
@property (nonatomic) BOOL isLabelIdle;
@property (nonatomic,strong) CalculatorBrain * brain;
@end

@implementation CalculatorViewController
@synthesize display;
@synthesize isLabelIdle;

@synthesize brain=_brain;

-(CalculatorBrain*)brain{
    if(_brain == nil){
        _brain = [[CalculatorBrain alloc] init]; 
    }
    
    return _brain;
}
- (IBAction)digitPressed:(UIButton * )sender {
    
    NSString *digit = [sender currentTitle];
    NSLog(@"User touched %@",digit);
    UILabel *mydispaly = self.display;
    //NSString * currentDisplayText = mydispaly.text;
    //NSString * newDisplayText = [currentDisplayText stringByAppendingString:digit];
    //[self.display setText:newDisplayText];
    
    if(self.isLabelIdle){
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.display.text = digit;
        self.isLabelIdle = YES;
    }
}
- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    
    self.isLabelIdle = NO;    
}

- (IBAction)operationPressed:(id)sender {
    if(self.isLabelIdle){
        [self enterPressed];
    }
    
    NSString *operation = [sender currentTitle];
    double result = [self.brain performOperation:operation];
    self.display.text = [NSString stringWithFormat:@"%g",result]; 
}
@end
