//
//  ViewController.m
//  WeatherApp
//
//  Created by Alvaro Alva on 9/18/20.
//

#import "ViewController.h"

float comparerObj;

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fahrenheit;
- (IBAction)actionBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *resultLbl;
@property (weak, nonatomic) IBOutlet UILabel *warningLbl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // set up the Values
    [self setValues];
}
- (IBAction)actionBtn:(id)sender {
    // set up the values
    [self setValues];
}
-(float)calculateCelcius {
    // conversion from Fahrenheit degrees to Celcius degrees
    float result;
    float degreesConverted = [self.fahrenheit.text floatValue];
    result = (degreesConverted - 32) *5.0/9.0;
    return result;
}
-(void) setValues {
    // memory allocation
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setMaximumFractionDigits:1];
    // retrieve celcius values from the calculateCelcius method
    NSString *celciusValue = [formatter stringFromNumber:[NSNumber numberWithFloat:self.calculateCelcius]];
    comparerObj = [[_fahrenheit text] floatValue];
    // if else conditions
    if(comparerObj<50){
        [self.resultLbl setText:celciusValue];
        [self.warningLbl setText:(@"Put on a winter jacket.")];
    } else if(comparerObj>=50 && comparerObj<=70){
        [self.resultLbl setText:celciusValue];
        [self.warningLbl setText:(@"Put on a light jacket.")];
    } else if(comparerObj>70) {
        [self.resultLbl setText:celciusValue];
        [self.warningLbl setText:(@"No jacket needed.")];
    } else {
        [self.warningLbl setText:(@"Invalid entry")];
    }
}
@end
