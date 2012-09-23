//
//  BluetoothManager.m
//  TestBluetooth
//
//  Created by Kévin Bessière on 16/09/12.
//
//

#import "BluetoothManager.h"

@implementation BluetoothManager

- (void)connect
{
    if (!_peerController)
    {
        _peerController = [[GKPeerPickerController alloc] init];
        [_peerController setDelegate:self];
        [_peerController setConnectionTypesMask:GKPeerPickerConnectionTypeNearby];
    }
    [_peerController show];
}

- (void)disconnect
{
    [_session disconnectFromAllPeers];
}

- (void)sendData:(NSData *)data
{
	NSLog(@"sending data");
	[_session sendDataToAllPeers:data withDataMode:GKSendDataReliable error:nil];
}

- (void)receiveData:(NSData *)data fromPeer:(NSString *)peer inSession:(GKSession *)session context:(void *)context
{
	NSString *str = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
	UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message received"
												   message:str
												  delegate:nil
										 cancelButtonTitle:@"Cool"
										 otherButtonTitles:nil];
	[alert show];
	[alert release];
	[str release];
}

#pragma mark - peerPickerController delegate

- (void)peerPickerController:(GKPeerPickerController *)picker didConnectPeer:(NSString *)peerID toSession:(GKSession *)session
{
    NSLog(@"Connected to %@", session);
	_session = session;
	[_session setDelegate:self];
	[_session setDataReceiveHandler:self withContext:nil];
	[picker dismiss];
}

- (void)peerPickerController:(GKPeerPickerController *)picker didSelectConnectionType:(GKPeerPickerConnectionType)type
{
    NSLog(@"Select connection Type");
}

- (void)peerPickerControllerDidCancel:(GKPeerPickerController *)picker
{
    NSLog(@"Did Cancel");
}

@end
