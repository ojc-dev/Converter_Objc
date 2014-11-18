//
//  NumberPadTest.m
//  Converter
//
//  Created by Oliver Christmann on 18.11.14.
//  Copyright (c) 2014 it-agile GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#define HC_SHORTHAND
#import <OCHamcrest/OCHamcrest.h>
#define MOCKITO_SHORTHAND
#import <OCMockito/OCMockito.h>
#import "NumberPad.h"

@interface NumberPadTest : XCTestCase

@end

@implementation NumberPadTest {
    NumberPad *numberPad;
}

- (UIButton *)buttonWithTag:(NSInteger)tag {
    UIButton *button = [[UIButton alloc] init];
    button.tag = tag;
    return button;
}

- (void)setUp {
    [super setUp];
    numberPad = [[NumberPad alloc] init];
}



-(void)testZahlDesButtonsErscheintImDisplay {
    //arrange
    UIButton *button = [self buttonWithTag:1];
    
    //act
    [numberPad buttonTouched:button];
    
    //assert
    assertThat(numberPad.currentValue, is(@"1"));
    
}

- (void)testZahlenDerButtonsErscheinenimDisplay {
    //arrange
    UIButton *button1 = [self buttonWithTag:1];
    UIButton *button2 = [self buttonWithTag:2];
    
    //act
    [numberPad buttonTouched:button1];
    [numberPad buttonTouched:button2];
    
    //assert
    assertThat(numberPad.currentValue, is(@"12"));
}

- (void)testMaximalZehnZiffernErlaubt {
    //arrange
    UIButton *button = [self buttonWithTag:0];
    UIButton *button1 = [self buttonWithTag:1];
    
    for (int i=0; i<10; i++) {
        [numberPad buttonTouched:button1];
    }
    
    //act
    [numberPad buttonTouched:button];
    
    //assert
    assertThat(numberPad.currentValue, is(@"1111111111"));
    
}

- (void)testNurEineFuehrendeNull {
    //arrange
    UIButton *button = [self buttonWithTag:0];
    
    [numberPad buttonTouched:button];
    
    //act
    [numberPad buttonTouched:button];
    
    //assert
    assertThat(numberPad.currentValue, is(@"0"));
}


- (void)testKomma {
    //arrange
    UIButton *button = [self buttonWithTag:10];
    
    //act
    [numberPad buttonTouched:button];
    
    //assert
    assertThat(numberPad.currentValue, is(@","));
}


- (void)testNurEinKomma {
    //arrange
    UIButton *button = [self buttonWithTag:10];
    
    [numberPad buttonTouched:button];
    
    //act
    [numberPad buttonTouched:button];
    
    //assert
    assertThat(numberPad.currentValue, is(@","));
}

- (void)testEingabeCLoeschtLetztesZeichen {
    // arrange
    UIButton *button1 = [self buttonWithTag:1];
    UIButton *buttonC = [self buttonWithTag:18];
    [numberPad buttonTouched:button1];
    
    //act
    [numberPad buttonTouched:buttonC];
    
    //assert
    assertThatInteger(numberPad.currentValue.length, equalToInt(0));
}



@end
