//
//  UIControlDemonstrationViewController.m
//  iOSJuniorApplication
//
//  Created by Jenei Viktor on 25/02/14.
//  Copyright (c) 2014 victo. All rights reserved.
//

#import "UIControlDemonstrationViewController.h"

@interface UIControlDemonstrationViewController () {
    __weak IBOutlet UITextField * _aTextField;
}

@end

@implementation UIControlDemonstrationViewController

- (IBAction)someButtonPressed:(id)sender {
    UIButton * aButton = sender;
    if ([aButton.titleLabel.text isEqualToString:@"ok"]) {
        [_aTextField resignFirstResponder];
    }
    NSLog(@"%@ button has been pressed", aButton.titleLabel.text);
}

- (IBAction)segmentControlValueChanged:(id)sender {
    UISegmentedControl * aSegmentedControl = sender;
    NSLog(@"%@ has been selected", [aSegmentedControl titleForSegmentAtIndex:aSegmentedControl.selectedSegmentIndex]);
}

- (IBAction)sliderValueChanged:(id)sender {
    UISlider * aSlider = sender;
    NSLog(@"Slider value has changed to: %.2f", aSlider.value);
}

- (IBAction)textFieldContentHasChanged:(id)sender {
    NSLog(@"TextField content has changed to: %@", _aTextField.text);
}

- (IBAction)switchValuechanged:(id)sender {
    UISwitch * aSwitch = sender;
    NSLog(@"Swtich value has changed to: %d", aSwitch.on);
}

- (IBAction)stepperValueHasChanged:(id)sender {
    UIStepper * aStepper = sender;
    NSLog(@"Stepper Value Has changed to: %.2f", aStepper.value);
}

- (IBAction)datePickerValueHasChanged:(id)sender {
    UIDatePicker * aDatePicker = sender;
    NSLog(@"Date picker's date has changed to: %@", aDatePicker.date);
}

@end
