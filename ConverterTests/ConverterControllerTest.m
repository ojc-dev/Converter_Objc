//
//  ConverterControllerTest.m
//  Converter
//
//  Created by Oliver Christmann on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "ConverterController.h"
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>


@interface ConverterController  (Testing)
@property (nonatomic) IBOutlet UILabel *displayLabel;
- (IBAction)buttonTouched:(id)sender;
@end

@interface ConverterControllerTest : XCTestCase

@end

@implementation ConverterControllerTest {
    
    ConverterController *controller;
    id displayLabel;
}

- (UIButton *)buttonWithTag:(NSInteger)tag {
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    return button;
}

- (void)setUp {
    [super setUp];
    
    controller = [[ConverterController alloc] init];
    displayLabel = [[UILabel alloc] init];
    controller.displayLabel = displayLabel;
}




- (void)testControllerHatNumberPad {
    [controller viewDidLoad];
    assertThat(controller.numberPad, is(notNilValue()));
}


- (void)testButtonTouchesWerdenAnNumerPadWeitergeleitet {
    id numberPad = mock([NumberPad class]);
    id button = [self buttonWithTag:1];
    controller.numberPad = numberPad;
    
    [controller buttonTouched:button];
    
    [verify(numberPad) buttonTouched:button];
}

@end
