//
//  BluetoothManager.h
//  TestBluetooth
//
//  Created by Kévin Bessière on 16/09/12.
//
//

#import <Foundation/Foundation.h>
#import <GameKit/GameKit.h>

@interface BluetoothManager : NSObject <GKPeerPickerControllerDelegate, GKSessionDelegate>
{
    GKSession * _session;
    GKPeerPickerController * _peerController;
}

- (void)connect;
- (void)disconnect;
- (void)sendData:(NSData *)data;

@end
