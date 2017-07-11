//
//  ViewController.m
//  KVO
//
//  Created by jyd on 2017/7/4.
//  Copyright © 2017年 jyd. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+DYWKVO.h"
#import "NSURL+url.h"
#import "UIViewController+Tracking.h"
#import "NSObject+Property.h"
#import "NSObject+Log.h"
#import "NSObject+Model.h"
#import "UIButton+Swizzling.h"
@interface ViewController ()

@property (nonatomic, strong) Person *p;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
    //KVO 注册监听
//    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    [p DYW_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    
    _p = p;
    
    // 交换方法,检测是否为nil
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/中文"];
    NSLog(@"%@",url);
    
    
    // 默认person，没有实现eat方法，可以通过performSelector调用，但是会报错。
    // 动态添加方法就不会报错
    [p performSelector:@selector(eat) withObject:nil];
    
    
    //给NSObject动态添加属性name
    NSObject *objc = [[NSObject alloc] init];
    objc.name = @"dyw";
    NSLog(@"%@",objc.name);
    
    
    //字典输出属性字符串
    NSDictionary *dic = @{@"name" : @"dyw", @"age" : [NSNumber numberWithInt:25], @"array" : @[@{@"height" : [NSNumber numberWithInt:176], @"weight" : [NSNumber numberWithInt:64]},@{@"height" : [NSNumber numberWithInt:156], @"weight" : [NSNumber numberWithInt:60]}], @"weman" : @{@"height" : [NSNumber numberWithInt:176], @"weight" : [NSNumber numberWithInt:64]}};
  Person * per =   [Person modelWithDic:dic];
    NSLog(@"%@  %d %@",per.name, per.age, per.array);
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"%@--%@",change,_p.name);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
   static int i = 0;
    i++;
    _p.name = [NSString stringWithFormat:@"%d",i];
    
}

- (IBAction)buttonClicked:(UIButton *)sender {
    NSLog(@"Click");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
