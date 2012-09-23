//
//  ViewController.h
//  TestBluetooth
//
//  Created by Kévin Bessière on 16/09/12.
//
//

#import <UIKit/UIKit.h>
#import "BluetoothManager.h"

@interface ViewController : UIViewController
{
    BluetoothManager * _peerManager;
}

@property (retain, nonatomic) IBOutlet UILabel * status;
@property (retain, nonatomic) IBOutlet UILabel * text;
@property (retain, nonatomic) IBOutlet UITextField * textToSend;
@property (retain, nonatomic) IBOutlet UIScrollView * scrollView;

- (IBAction)connect:(id)sender;
- (IBAction)disconnect:(id)sender;
- (IBAction)sendData:(id)sender;

@end
