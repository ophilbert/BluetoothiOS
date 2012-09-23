//
//  ViewController.m
//  TestBluetooth
//
//  Created by Kévin Bessière on 16/09/12.
//
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize status;

- (void)viewDidLoad
{
    [super viewDidLoad];
    _peerManager = [[BluetoothManager alloc] init];
	[_scrollView setContentSize:CGSizeMake(320, 600)];
}

- (void)viewDidUnload
{
    [self setStatus:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    }
    else
    {
        return YES;
    }
}

- (IBAction)connect:(id)sender
{
    [_peerManager connect];
	[status setText:@"Now connected"];
}

- (IBAction)disconnect:(id)sender
{
    [_peerManager disconnect];
	[status setText:@"You've beed disconnected"];
}

- (IBAction)sendData:(id)sender
{
	[_peerManager sendData:[_textToSend.text dataUsingEncoding:NSUTF8StringEncoding]];
}

- (void)dealloc
{
    [status release];
	[_text release];
	[_textToSend release];
	[_peerManager release];
	[_scrollView release];
    [super dealloc];
}
@end
