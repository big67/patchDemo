//
//  ViewController.m
//  patchDemo
//
//  Created by a on 16/6/2.
//  Copyright © 2016年 a. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL) invalidePSD:(NSString *)psd
{
    return true;
}

- (IBAction)textDidChanged:(id)sender {
    
    UITextField *tf = (UITextField *)sender;
    NSLog(@"%@: %@", tf.text, [self invalidePSD:tf.text]?@"有效":@"无效");
    
}



@end
