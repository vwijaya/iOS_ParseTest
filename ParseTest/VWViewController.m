//
//  VWViewController.m
//  ParseTest
//
//  Created by Valerino on 7/21/14.
//  Copyright (c) 2014 VW. All rights reserved.
//

#import "VWViewController.h"

@interface VWViewController ()

@property (strong, nonatomic) IBOutlet UITextField *usernameTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation VWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    //[testObject setObject:@"bar" forKey:@"foo"];
    //[testObject save];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveUserButtonPressed:(id)sender {
    
    // Creating PFObject
    PFObject *loginCredentials = [PFObject objectWithClassName:@"LoginCredentials"];
    loginCredentials[@"name"] = self.usernameTextField.text;
    loginCredentials[@"password"] = self.passwordTextField.text;
    
    // Saving PFObject
    [loginCredentials saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error
                                                  ){
        if(succeeded){
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save"
                                                                message:@"Your object saved"
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
            NSLog(@"Save successful");
        } else if(error) {
            NSLog(@"%@", error);
        }
    }];
}
@end
