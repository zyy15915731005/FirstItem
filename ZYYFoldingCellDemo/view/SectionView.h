//
//  SectionView.h
//  折叠的cell实现
//
//  Created by cui on 16/11/8.
//  Copyright © 2016年 cn. All rights reserved.
//

#import <UIKit/UIKit.h>
@class myModel;
typedef void (^callBackBlock)(BOOL);
@interface SectionView : UITableViewHeaderFooterView
@property (nonatomic,strong)myModel *model;
@property (nonatomic,strong)callBackBlock block;
@property (nonatomic,strong) UIImageView *imageView;
@property (nonatomic,strong) UILabel *titleLabel;
@end
