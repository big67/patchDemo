//
//  CloudViewController.m
//  patchDemo
//
//  Created by a on 16/6/3.
//  Copyright © 2016年 a. All rights reserved.
//

#import "CloudViewController.h"
#import "pop.h"

#define ARC4RANDOM_MAX      0x100000000

@interface CloudViewController ()

@end

@implementation CloudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    

    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(addCloudAfterDelay) userInfo:nil repeats:YES];
    [timer fire];
    
}

-(void)addCloudAfterDelay{
    CGFloat delay = (arc4random() % 100)/100.0 + 0.5;
    [self performSelector:@selector(addACloud) withObject:nil afterDelay:delay];
}

-(void)addACloud{
    [self addCloud];
}

-(void)addCloud{
//    arc4random() % 100
    
    CGFloat ramX =  (CGFloat)(arc4random() % 40) - 20 + self.view.frame.size.width*.5;
    CGFloat ramY =  self.view.frame.size.height - (CGFloat)(arc4random() % 50) - 100.0;
    CGFloat ramW =  20.0 + (CGFloat)(arc4random() % 100);
    CGFloat ramH = ramW;
    CGFloat ramO =  200.0 + (CGFloat)(arc4random() % 150);
    CGFloat ramT =  (CGFloat)(arc4random() % 200)/100.0;
    CGFloat ramS =  (CGFloat)(arc4random() % 500)/100.0 + 100.0;
    CGFloat ramA =  (CGFloat)(arc4random() % 100)/100.0 + 0.1;
    CGFloat ramD =  (CGFloat)(arc4random() % 500)/100.0 + 10.0;
    
    if(ramX < self.view.frame.size.width*.5)
        ramO = -ramO;
    
    UIImageView *imgV = [[UIImageView alloc]initWithFrame:CGRectMake(ramX, ramY, 1, 1)];
    imgV.alpha = 0;
    imgV.image = [UIImage imageNamed:@"cloud10"];
    [self.view addSubview:imgV];
    
    POPBasicAnimation *animS = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
    animS.fromValue = [NSValue valueWithCGSize:CGSizeMake(ramW, ramH)];
    animS.toValue = [NSValue valueWithCGSize:CGSizeMake(ramS, ramS)];
    animS.duration = ramD;
    
    __weak UIImageView *wImgV = imgV;
    
    [animS setCompletionBlock:^(POPAnimation *animate, BOOL isFinish){
        if(isFinish){
            [wImgV.layer removeAllAnimations];
            [wImgV removeFromSuperview];
        }
    }];
    
    POPBasicAnimation *animA = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
    animA.duration = ramD;
    animA.toValue = @(ramA);
    animA.fromValue = @(0);
    
    POPBasicAnimation *animP = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
    animP.duration = ramD;
    animP.toValue = [NSValue valueWithCGPoint:CGPointMake(ramX+ramO, ramY+fabs(ramO)*ramT)];
    
    [imgV.layer pop_addAnimation:animS forKey:@"z"];
    [imgV.layer pop_addAnimation:animA forKey:@"a"];
    [imgV.layer pop_addAnimation:animP forKey:@"p"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
