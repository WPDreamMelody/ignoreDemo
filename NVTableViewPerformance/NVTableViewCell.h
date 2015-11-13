//
//  NVTableViewCell.h
//  NVTableViewPerformance
//
//  Created by Yuki on 15/11/12.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *identifier = @"TableViewCellIdentiter";

@interface NVTableViewCell : UITableViewCell
@property (strong, nonatomic) UIImageView *logoImage;
@property (strong, nonatomic) UILabel *logoLabel;

@end
