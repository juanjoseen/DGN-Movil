//
//  AyudasViewController.m
//  DGN Movil
//
//  Created by Juan Jose Elias Navaro on 15/09/15.
//  Copyright (c) 2015 AxkanSoftware. All rights reserved.
//

#import "AyudasViewController.h"

@interface AyudasViewController ()

@end

@implementation AyudasViewController{
    CGFloat width;
    BOOL didTouch;
    BOOL didMove;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    didTouch = NO;
    didMove  = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    width = self.view.frame.size.width;
    self.img2.frame = CGRectOffset(self.img2.frame, width, 0);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    if (!didTouch)
        didTouch = YES;
    didMove  = NO;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    if (didTouch){
        didMove = YES;
        CGPoint current = [[touches anyObject] locationInView:self.view];
        CGPoint prev    = [[touches anyObject] previousLocationInView:self.view];
        CGFloat diff    = current.x - prev.x;
        self.img1.frame = CGRectOffset(self.img1.frame, diff, 0.0);
        self.img2.frame = CGRectOffset(self.img2.frame, diff, 0.0);
    } else {
        didMove = NO;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if (didMove){
        CGFloat dif1 = self.view.center.x - self.img1.center.x;
        CGFloat dif2 = self.view.center.x - self.img2.center.x;
        if (fabs(dif1)>fabs(dif2)){
            [UIView animateWithDuration:0.15 animations:^{
                self.img1.frame = CGRectOffset(self.img1.frame, dif2, 0.0);
                self.img2.frame = CGRectOffset(self.img2.frame, dif2, 0.0);
            } completion:^(BOOL finished) {
                if (self.img1.frame.origin.x < 0){
                    self.img1.center = CGPointMake(width*1.5, self.img1.center.y);
                } else if (self.img1.frame.origin.x > width){
                    self.img1.center = CGPointMake(width*-.5, self.img1.center.y);
                }
                if (self.img2.frame.origin.x < 0){
                    self.img2.center = CGPointMake(width*1.5, self.img2.center.y);
                } else if (self.img2.frame.origin.x > width){
                    self.img2.center = CGPointMake(width*-.5, self.img2.center.y);
                }
            }];
            
        } else {
            [UIView animateWithDuration:0.15 animations:^{
                self.img1.frame = CGRectOffset(self.img1.frame, dif1, 0.0);
                self.img2.frame = CGRectOffset(self.img2.frame, dif1, 0.0);
            } completion:^(BOOL finished) {
                if (self.img1.frame.origin.x < 0){
                    self.img1.center = CGPointMake(width*1.5, self.img1.center.y);
                } else if (self.img1.frame.origin.x > width){
                    self.img1.center = CGPointMake(width*-.5, self.img1.center.y);
                }
                if (self.img2.frame.origin.x < 0){
                    self.img2.center = CGPointMake(width*1.5, self.img2.center.y);
                } else if (self.img2.frame.origin.x > width){
                    self.img2.center = CGPointMake(width*-.5, self.img2.center.y);
                }
            }];
        }
        didMove = NO;
    }
    didTouch = NO;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
