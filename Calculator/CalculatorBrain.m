//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Intuit Admin on 13/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic,strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain
@synthesize operandStack=_operandStack;

-(NSMutableArray *) operandStack{
    
    if(_operandStack == nil){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void)setOperandStack:(NSMutableArray *)anArray{
    _operandStack = anArray;
}

-(void) pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

-(double)popOperand{
    NSNumber * operandObject = [self.operandStack lastObject];
    if(operandObject != nil){
        [self.operandStack removeLastObject];
    }
    return [operandObject doubleValue];
}

-(double) performOperation:(NSString *)operation{
    double result = 0;
    
    if([operation isEqualToString:@"+"]){
        result = [self popOperand]+[self popOperand];
    }else if ([@"*" isEqualToString:operation]) {
        result = [self popOperand]+[self popOperand]; 
    }else if([@"/" isEqualToString:operation]){
        double divisor = [self popOperand];
        if(divisor)result=[self popOperand]/divisor;
        
    }else if([operation isEqualToString:@"-"]){
        double subtrahand = [self popOperand];
        result = [self popOperand] - subtrahand;
    }
     
    [self pushOperand:result];
    
    return result;
}

@end
