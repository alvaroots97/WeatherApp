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
    // Do any additional setup after loading the view.
    [self setValues];
}
- (IBAction)actionBtn:(id)sender {
    [self setValues];
}
-(float)calculateCelcius {
    float result;
    float degreesConverted = [self.fahrenheit.text floatValue];
    result = (degreesConverted - 32) *5.0/9.0;
    return result;
}
-(void) setValues {
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setMaximumFractionDigits:1];
    NSString *celciusValue = [formatter stringFromNumber:[NSNumber numberWithFloat:self.calculateCelcius]];
    comparerObj = [[_fahrenheit text] floatValue];
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
