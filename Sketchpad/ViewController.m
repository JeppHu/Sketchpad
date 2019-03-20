//
//  ViewController.m
//  Sketchpad
//
//  Created by Jepp on 2019/3/20.
//  Copyright © 2019年 Jepp. All rights reserved.
//

#import "ViewController.h"
#import "JPSketchpadView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *lineWidthSlider;
@property (weak, nonatomic) IBOutlet JPSketchpadView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.contentView.lineWidth = self.lineWidthSlider.value;
}


#pragma mark - Action

- (IBAction)clearAction:(id)sender {
    [self.contentView clear];
}

- (IBAction)backAction:(id)sender {
    [self.contentView back];
}

- (IBAction)deleteAction:(id)sender {
    [self.contentView delete];
}

- (IBAction)saveAction:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.contentView.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.contentView.layer renderInContext:ctx];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
}

- (IBAction)lineWidthValueChange:(UISlider *)sender {
    self.contentView.lineWidth = sender.value;
}

- (IBAction)lineColorAction:(UIButton *)sender {
    self.contentView.lineColor = sender.backgroundColor;
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSLog(@"%@", error);
}

@end
