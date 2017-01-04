//
//  SectionView.m
//  折叠的cell实现
//
//  Created by cui on 16/11/8.
//  Copyright © 2016年 cn. All rights reserved.
//

#import "SectionView.h"
#import "myModel.h"
@implementation SectionView
-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        [self setupUI];
    }
    return self;
}


-(void)setupUI
{
    CGFloat w = [UIScreen mainScreen].bounds.size.width;
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 14.5, 15, 15)];
    self.imageView.image = [UIImage imageNamed:@"三角形"];
    [self.contentView addSubview:self.imageView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, w, 44)];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:btn];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, (44 - 20) / 2, w-20, 20)];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    self.titleLabel.textColor = [UIColor blackColor];
    
    
    UIView *lineView = [[UIView alloc]initWithFrame:CGRectMake(0, 43, w, 1)];
    lineView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:lineView];
    [self.contentView addSubview:self.titleLabel];
    
    self.contentView.backgroundColor = [UIColor grayColor];
}

-(void)btnClick:(UIButton *)sender
{
    self.model.isExpand = !self.model.isExpand;
    if(self.model.isExpand)
    {
        self.imageView.transform = CGAffineTransformIdentity;
    }else
    {
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }
    
    if(self.block)
    {
        self.block(self.model.isExpand);
    }
}

-(void)setModel:(myModel *)model
{
    if(_model != model)
    {
        _model = model;
    }
    self.titleLabel.text = model.title;
    if(model.isExpand)
    {
        self.imageView.transform = CGAffineTransformIdentity;
    }else
    {
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
    }

    
}
@end
