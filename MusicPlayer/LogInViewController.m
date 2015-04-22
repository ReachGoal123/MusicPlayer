//
//  LogInViewController.m
//  MusicPlayer
//
//  Created by tarena3812 on 15/3/1.
//  Copyright (c) 2015年 tarena. All rights reserved.
//

#import "LogInViewController.h"

@interface LogInViewController ()
{
    UITextField *userNameTextF;
    UITextField *passwordTextF;
}
@end

@implementation LogInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self createTextView];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(goBack)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(login)];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

//用户名密码输入文档
- (void)createTextView
{
    UIView *loginV = [[UIView alloc]initWithFrame:CGRectMake(0, 300, self.view.frame.size.width, 85)];
    loginV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:loginV];
    //线
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 25, self.view.frame.size.width, 20)];
    label.text = @"______________________________________";
    label.textColor = [UIColor lightGrayColor];
    [loginV addSubview:label];
    
    
    userNameTextF = [[UITextField alloc]initWithFrame:CGRectMake(15, 5, self.view.frame.size.width-15, 30)];
    userNameTextF.placeholder = @"账号";
    userNameTextF.font = [UIFont systemFontOfSize:14];
    passwordTextF = [[UITextField alloc]initWithFrame:CGRectMake(15, 45, self.view.frame.size.width-10, 30)];
    passwordTextF.placeholder = @"密码";
    passwordTextF.font = [UIFont systemFontOfSize:14];
    [loginV addSubview:userNameTextF];
    [loginV addSubview:passwordTextF];
}



- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)goBack
{
    self.tabBarController.tabBar.hidden = NO;
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)login
{
    
}


@end
