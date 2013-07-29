//
//  BaoGuanMController.m
//  ExPressDeliveryPro
//
//  Created by admin on 13-2-19.
//  Copyright (c) 2013年 admin. All rights reserved.
//

//hello world!fhdhgfhfdhgf

#import "BaoGuanMController.h"

@interface BaoGuanMController ()

@end

@implementation BaoGuanMController

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
    
    // Do any additional setup after loading the view from its nib.
    UIImageView *bgImageView=[[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image=[UIImage imageNamed:@"内页背景图.png"];
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
    [bgImageView release];
    
    self.title=@"报关管理";
    self.navigationController.navigationBar.barStyle=UIBarStyleBlack;
    
    //返回按钮
    UIButton *butBack=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    butBack.frame=CGRectMake(0, 0, 50, 30);
    [butBack setTitle:@"返回" forState:UIControlStateNormal];
    [butBack addTarget:self action:@selector(backLastScreen) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *leftButton=[[UIBarButtonItem alloc] initWithCustomView:butBack];
    self.navigationItem.leftBarButtonItem=leftButton;
    [leftButton release];
    
    
    //扫描按钮
    UIButton *butScan=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    butScan.frame=CGRectMake(0, 0, 50, 30);
    [butScan setTitle:@"扫描" forState:UIControlStateNormal];
    [butScan addTarget:self action:@selector(scanAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton=[[UIBarButtonItem alloc] initWithCustomView:butScan];
    self.navigationItem.rightBarButtonItem=rightButton;
    [rightButton release];
    
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.backgroundColor=[UIColor clearColor];
    //去掉表格之间的分割线
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.scrollEnabled=NO;
    
    self.sourceArr=[NSMutableArray arrayWithObjects:@"货号",nil];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"[self.sourceArr count]*************=%d",[self.sourceArr count]);
    if (tableView.tag==100) {
        return [self.sourceArr2 count];
        NSLog(@"第二个table");
    }
    return [self.sourceArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.tag!=100) {
        
        NSLog(@"11111111111111111");
        
        static NSString *CellIdentifier=@"Cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell==nil) {
            cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        
        for (UIView *view in cell.contentView.subviews) {
            [view removeFromSuperview];
        }
        
        cell.contentView.backgroundColor = [UIColor clearColor];
        cell.textLabel.backgroundColor = [UIColor clearColor];
        cell.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选项底条选中前.png"]];
        //    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选项底条选中.png"]];
        UILabel *titileLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 0, 240, 45)];
        titileLabel.backgroundColor = [UIColor clearColor];
        titileLabel.text=[self.sourceArr objectAtIndex:indexPath.row];
        [cell.contentView addSubview:titileLabel];
        [titileLabel release];
        
        UITextField *textF=[[UITextField alloc] initWithFrame:CGRectMake(70, 7, 180, 30)];
        textF.borderStyle=UITextBorderStyleLine;
        textF.textAlignment=NSTextAlignmentLeft;
        textF.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        textF.delegate=self;
        [cell.contentView addSubview:textF];
        [textF release];
        
        UIButton *checkBut=[UIButton buttonWithType:UIButtonTypeRoundedRect];
        checkBut.frame=CGRectMake(260, 7, 50, 30);
        [checkBut setTitle:@"查找" forState:UIControlStateNormal];
        [checkBut addTarget:self action:@selector(check) forControlEvents:UIControlEventTouchUpInside];
        [checkBut setTintColor:[UIColor clearColor]];
        [cell.contentView addSubview:checkBut];
        
        return cell;
    }else{
        
        NSLog(@"22222222222222222");
        static NSString *CellIdentifier=@"Cell";
        UITableViewCell *cell1=[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell1==nil) {
            cell1=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
            cell1.selectionStyle=UITableViewCellSelectionStyleNone;
        }
        
        for (UIView *view in cell1.contentView.subviews) {
            [view removeFromSuperview];
        }
        
        cell1.contentView.backgroundColor = [UIColor clearColor];
        cell1.textLabel.backgroundColor = [UIColor clearColor];
        cell1.backgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选项底条选中前.png"]];
        //    cell.selectedBackgroundView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选项底条选中.png"]];
        UILabel *titileLabel=[[UILabel alloc] initWithFrame:CGRectMake(30, 0, 240, 45)];
        titileLabel.backgroundColor = [UIColor clearColor];
        titileLabel.text=[self.sourceArr2 objectAtIndex:indexPath.row];
        [cell1.contentView addSubview:titileLabel];
        [titileLabel release];
        
        //        UITextField *textF=[[UITextField alloc] initWithFrame:CGRectMake(70, 7, 180, 30)];
        //        textF.borderStyle=UITextBorderStyleLine;
        //        textF.textAlignment=NSTextAlignmentLeft;
        //        textF.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        //        [cell.contentView addSubview:textF];
        //        [textF release];
        
        /*
        if (indexPath.row==[self.sourceArr count]-1) {
            UITextField *textF=[[UITextField alloc] initWithFrame:CGRectMake(70, 7, 180, 30)];
            textF.borderStyle=UITextBorderStyleLine;
            textF.textAlignment=NSTextAlignmentLeft;
            textF.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
            textF.delegate=self;
            textF.enabled=NO;
            [cell1.contentView addSubview:textF];
            [textF release];
            
            UIButton *checkBut=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            checkBut.frame=CGRectMake(260, 7, 50, 30);
            [checkBut setTitle:@"查找" forState:UIControlStateNormal];
            [checkBut addTarget:self action:@selector(checkOther) forControlEvents:UIControlEventTouchUpInside];
            [checkBut setTintColor:[UIColor clearColor]];
            [cell1.contentView addSubview:checkBut];
        }
        */
        return cell1;
    }
    return nil;
    
}

-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
}

#pragma marks - 查找
-(void)check
{
    
    self.sourceArr2=[NSArray arrayWithObjects:@"货物状态", @"客户编号",@"目的城市",@"运输方式",@"品名",@"材质",@"数量",@"件数",@"货值",@"包装",@"重量",@"体积",@"打包",@"垫付",nil];
    
    
    UITableView *tView=[[UITableView alloc] initWithFrame:CGRectMake(0, 400, 320, 280) style:UITableViewStylePlain];
    tView.tag=100;
    tView.dataSource=self;
    tView.delegate=self;
    tView.backgroundColor=[UIColor clearColor];
    tView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    tView.frame=CGRectMake(0, 44, 320, 280);
    [self.tableView insertSubview:tView atIndex:0];
    [UIView commitAnimations];
    
}


-(void)backLastScreen
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

-(void)scanAction
{
    ScanPageController *scanPageC=[[ScanPageController alloc] init];
    [self.navigationController pushViewController:scanPageC animated:YES];
    [scanPageC release];
}


//保存
- (IBAction)save:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}

//状态
- (IBAction)state:(id)sender {
    
    UIView *bgView=[[UIView alloc] initWithFrame:CGRectMake(40, 460, 240, 150)];
    bgView.tag=100;
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:1];
    
    bgView.frame=CGRectMake(40, 270, 240, 150);
    bgView.layer.cornerRadius = 8.0f;
    bgView.layer.borderWidth = 1.0f;
    bgView.layer.masksToBounds = YES;
    bgView.layer.borderColor = [[UIColor whiteColor] CGColor];
    bgView.backgroundColor = [UIColor colorWithRed:66.0/255 green:173.0/255 blue:202.0/255 alpha:1];
    [self.view addSubview:bgView];
    
    [UIView commitAnimations];
    
    UIButton *but1=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but1.frame=CGRectMake(20, 5, 200, 30);
    [but1 setTitle:@"入库" forState:UIControlStateNormal];
    [but1 addTarget:self action:@selector(goIntoKu:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:but1];
    
    UIButton *but2=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but2.frame=CGRectMake(20, 40, 200, 30);
    [but2 setTitle:@"报关" forState:UIControlStateNormal];
    [but2 addTarget:self action:@selector(baoguan:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:but2];
    
    UIButton *but3=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but3.frame=CGRectMake(20, 75, 200, 30);
    [but3 setTitle:@"装车" forState:UIControlStateNormal];
    [but3 addTarget:self action:@selector(loadCar:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:but3];
    
    
    UIButton *but4=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    but4.frame=CGRectMake(20, 110, 200, 30);
    [but4 setTitle:@"出境" forState:UIControlStateNormal];
    [but4 addTarget:self action:@selector(goOutField:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:but4];
    
    
    
    
    [bgView release];
}

-(void)goIntoKu:(id)sender
{
    NSLog(@"入库");
    UIView *bgView=[self.view viewWithTag:100];
    [bgView removeFromSuperview];
}

-(void)baoguan:(id)sender
{
    NSLog(@"打包");
    UIView *bgView=[self.view viewWithTag:100];
    [bgView removeFromSuperview];
}

-(void)loadCar:(id)sender
{
    NSLog(@"装车");
    UIView *bgView=[self.view viewWithTag:100];
    [bgView removeFromSuperview];
}

-(void)goOutField:(id)sender
{
    NSLog(@"出境");
    UIView *bgView=[self.view viewWithTag:100];
    [bgView removeFromSuperview];
}

//拍照
- (IBAction)takePhoto:(id)sender {
    TakePhotoController *takePhoto=[[TakePhotoController alloc] init];
    [self.navigationController pushViewController:takePhoto animated:YES];
    [takePhoto release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
    [_tableView release];
    [_sourceArr release];
    [_sourceArr2 release];
    [super dealloc];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{

    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

@end
