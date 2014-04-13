//
//  ViewController.m
//  cosplayisforeveryone
//
//  Created by Luchinda Wollin on 2014-01-03.
//  Copyright (c) 2014 Luchinda Wollin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mailcontroller, adress, adressArray, myImage, imageData;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    adress = @"";
    adressArray = [[NSArray alloc]initWithObjects:adress, nil];
    myImage = [UIImage imageNamed:@"Image.png"];
    imageData = UIImagePNGRepresentation(myImage);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)shareButton {
    
    if ([MFMailComposeViewController canSendMail]) {
        NSLog(@"Can send email");
        mailcontroller = [[MFMailComposeViewController alloc] init];
        [mailcontroller setMailComposeDelegate:self];
        [mailcontroller addAttachmentData:imageData mimeType:@"image/png" fileName:@"Name"];
        [mailcontroller setMessageBody:@"Message" isHTML:NO];
        [mailcontroller setToRecipients:adressArray];
        [mailcontroller setSubject:@"Subject"];
        [mailcontroller setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
        if (mailcontroller)
            [self presentViewController:mailcontroller animated:YES completion:nil];
        NSLog(@"Everything worked out fine...");
    }
    else {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Failure" message:@"Your device does not support the composer sheet" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        NSLog(@"This did not work out for us....");
        
    };
}

-(void)mailComposeController:(MFMailComposeViewController*)controller
         didFinishWithResult:(MFMailComposeResult)result
                       error:(NSError*)error;
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"cancel?");
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultSaved:
            NSLog(@"saved?");
            [self dismissViewControllerAnimated:YES completion:nil];
            break;
        case MFMailComposeResultSent:
            NSLog(@"Sent succed");
            [self mailOk];
            break;
        case MFMailComposeResultFailed:
            NSLog(@"sent failue");
            NSLog(@"%@",error);
            break;
        default:
            break;
    }
}

- (void)mailOk {
    UIAlertView* success = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Thank you for sharing our picture!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [success show];
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end

