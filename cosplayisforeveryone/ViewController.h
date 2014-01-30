//
//  ViewController.h
//  cosplayisforeveryone
//
//  Created by Luchinda Wollin on 2014-01-03.
//  Copyright (c) 2014 Luchinda Wollin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

@interface ViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) MFMailComposeViewController *mailcontroller;
@property (strong, nonatomic) NSString *adress;
@property (strong, nonatomic) NSArray *adressArray;
@property (strong, nonatomic) UIImage *myImage;
@property (strong, nonatomic) NSData *imageData;

- (IBAction)shareButton;

@end

