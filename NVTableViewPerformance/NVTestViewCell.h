//
//  NVTestViewCell.h
//  NVTableViewPerformance
//
//  Created by Yuki on 15/11/12.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *testidentifier = @"NVTestViewCellIdentiter";

@interface NVTestViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end
