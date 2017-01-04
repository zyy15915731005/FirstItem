//
//  ViewController.m
//  ZYYFoldingCellDemo
//
//  Created by Mr.zhangYY on 2017/1/3.
//  Copyright © 2017年 Pte_Team. All rights reserved.
//

#import "ViewController.h"
#import "myModel.h"
#import "SectionView.h"
#import "cellModel.h"
static NSString *const ID = @"UITableViewCell";
static NSString *const HEADER = @"SectionView";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self layoutSubviews];
    [self InitializationDataArray];
}

-(void)layoutSubviews
{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.tableFooterView = [UITableView new];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    [_tableView registerClass:[SectionView class] forHeaderFooterViewReuseIdentifier:HEADER];
}

-(void)InitializationDataArray
{
    _dataArray = [[NSMutableArray alloc]init];
    for(int i=0;i<20;i++)
    {
        myModel *model = [[myModel alloc]init];
        model.title = [NSString stringWithFormat:@"%d",i];
        model.isExpand = NO;
        NSMutableArray *array = [NSMutableArray new];
        for(int j=0; j<10;j++)
        {
            cellModel *cell = [[cellModel alloc]init];
            cell.title = [NSString stringWithFormat:@"LivenCell==Section:%d,Row:%d",i,j];
            [array addObject:cell];
        }
        model.array = array;
        [_dataArray addObject:model];
    }
    
    
}
#pragma mark - tableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    myModel *model = _dataArray[section];
    return model.isExpand?model.array.count:0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    myModel *model = _dataArray[indexPath.section];
    cellModel *cellModel = model.array[indexPath.row];
    cell.textLabel.text = cellModel.title;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    SectionView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HEADER];
    myModel *model = _dataArray[section];
    view.model = model;
    view.block = ^(BOOL isExpanded)
    {
        [tableView reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationFade];
        
    };
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}

@end
