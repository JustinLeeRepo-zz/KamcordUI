//
//  PlayerViewController.m
//  UIInterview
//
//  Created by Tim Johnson on 11/13/15.
//  Copyright © 2015 Kamcord. All rights reserved.
//

@import MessageUI;
#import "PlayerViewController.h"

@interface PlayerViewController () <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIButton *dismissButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *liveBadge;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIView *topOverlay;
@property (weak, nonatomic) IBOutlet UIView *bottomOverlay;
@property (weak, nonatomic) IBOutlet UIView *playerView;

@property (nonatomic, assign) BOOL activeOverlay;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation PlayerViewController

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
	UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(toggleOverlay)];
	[self.playerView addGestureRecognizer: tapGesture];
}

#pragma mark - Interface Builder Actions

- (IBAction)dismissButtonPressed:(id)sender
{
	[self dismissViewControllerAnimated: YES completion: nil];
}

- (IBAction)shareButtonPressed:(id)sender
{
	if ( [MFMailComposeViewController canSendMail] )
	{
		MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc] init];
		mailController.mailComposeDelegate = self;
		NSString *subject = @"Kamcord UI";
		[mailController setSubject: subject];
		[mailController setMessageBody: @"kamcord UI shared" isHTML: NO];
		mailController.navigationBar.tintColor = [UIColor whiteColor];
		[self presentViewController: mailController animated: YES completion: nil];
	}
	else
	{
		NSString *message = [NSString stringWithFormat: @"Your device is not configured for sending emails."];
		
		UIAlertController *alert = [UIAlertController alertControllerWithTitle: @"Email Unavailable"
																	   message: message
																preferredStyle: UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle: @"OK"
														 style: UIAlertActionStyleDefault
													   handler: nil];
		[alert addAction: action];
		[self presentViewController: alert animated: YES completion: nil];
	}
}

#pragma mark - MFMailCompose Delegate

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
	switch ( result )
	{
		case MFMailComposeResultSent:
			break;
		case MFMailComposeResultSaved:
		case MFMailComposeResultCancelled:
		case MFMailComposeResultFailed:
		default:
			break;
	}
	
	[self dismissViewControllerAnimated: YES completion: nil];
}

#pragma mark - Overide Setter/Getter

- (BOOL)activeOverlay
{
	return self.topOverlay.alpha != 0.0f;
}

#pragma mark - Overlay

- (void)toggleOverlay
{
	if ( self.activeOverlay )
	{
		[self hideOverlay];
	}
	else
	{
		[self showOverlay];
	}
}

- (void)hideOverlay
{
	[self.timer invalidate];
	[UIView animateWithDuration: 0.25f animations:^{
		self.topOverlay.alpha = 0.0f;
		self.bottomOverlay.alpha = 0.0f;
	}];
}

- (void)showOverlay
{
	NSDate *currentDate = [NSDate date];
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat: @"h:mma"];
	self.timeLabel.text = [dateFormatter stringFromDate: currentDate];
	
	[UIView animateWithDuration: 0.25f animations:^{
		self.topOverlay.alpha = 1.0f;
		self.bottomOverlay.alpha = 1.0f;
	} completion:^(BOOL finished) {
		self.timer = [NSTimer scheduledTimerWithTimeInterval: 3.0f
										 target: self
									   selector: @selector(hideOverlay)
									   userInfo: nil
										repeats: NO];
	}];
}

@end
