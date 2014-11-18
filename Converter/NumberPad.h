//
//  NumberPad.h
//  Converter
//
//  Created by Oliver Christmann on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NumberPad : NSObject

@property (nonatomic, copy, readonly) NSString *currentValue;

- (void)buttonTouched:(id)sender;

@end
