//
//  ViewController.m
//  GestureLab
//
//  Created by Bob Leano on 2/1/17.
//  Copyright © 2017 Y.CORP.YAHOO.COM\leano. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *trayView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onTrayPanGesture:(UIPanGestureRecognizer *)sender {
    
    // Absolute (x,y) coordinates in parentView
    CGPoint location = [sender locationInView:self.view];
    CGPoint translation = [sender translationInView: self.view];
        NSLog(@"translation: %@\n\n", NSStringFromCGPoint(translation));    if (sender.state == UIGestureRecognizerStateBegan) {
        self.trayOriginalCenter = self.trayView.center;
        NSLog(@"Gesture began at: %@\n\n", NSStringFromCGPoint(location));
    } else if (sender.state == UIGestureRecognizerStateChanged) {
        self.trayView.center = CGPointMake(self.trayOriginalCenter.x,
                                      self.trayOriginalCenter.y + translation.y);
        NSLog(@"translation: %@\n\n", NSStringFromCGPoint(translation));
        NSLog(@"Gesture changed at: %@\n\n", NSStringFromCGPoint(location));
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended at: %@\n\n", NSStringFromCGPoint(location));
    }
}


@end
