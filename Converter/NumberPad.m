//
//  NumberPad.m
//  Converter
//
//  Created by Oliver Christmann on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NumberPad.h"

@implementation NumberPad

- (void)buttonTouched:(id)sender {
    UIButton *button = sender;
    NSString *oldText = self.currentValue;
    if (!oldText) {
        oldText = @"";
    }
    
    
    if (oldText.length < 10) {
        if (!([button tag] == 0 && [oldText isEqualToString:@"0"])) {
            NSString *inputString = @"";
            
            switch (button.tag) {
                case 10:    // Komma
                    if ([oldText rangeOfString:@","].location == NSNotFound) {
                        inputString = @",";
                    }
                    break;
                case 18:
                    if (oldText.length > 0) {
                        oldText = [oldText substringToIndex:oldText.length - 1];
                    }
                    break;
                default:
                    inputString = [NSString stringWithFormat:@"%li", (long)button.tag];
                    break;
            }
            
            _currentValue = [NSString stringWithFormat:@"%@%@", oldText, inputString];
        }
    }
}

@end
