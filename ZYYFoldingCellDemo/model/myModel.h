//
//  myModel.h
//  折叠的cell实现
//
//  Created by cui on 16/11/8.
//  Copyright © 2016年 cn. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface myModel : NSObject
@property (nonatomic,assign) BOOL isExpand;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSArray *array;
@end
