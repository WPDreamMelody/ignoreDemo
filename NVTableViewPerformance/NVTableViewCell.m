//
//  NVTableViewCell.m
//  NVTableViewPerformance
//
//  Created by Yuki on 15/11/12.
//  Copyright © 2015年 DianPing. All rights reserved.
//

#import "NVTableViewCell.h"

@implementation NVTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        [self initView];
    }
    return  self;
}

- (void)initView{
    if(!self.logoImage){
        self.logoImage = [[UIImageView alloc]init];
        [self addSubview:self.logoImage];
    }
    
    if(!self.logoLabel){
        self.logoLabel = [[UILabel alloc]init];
        [self addSubview:self.logoLabel];
    }
}


- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.logoImage.frame = CGRectMake(0, 0, self.frame.size.height, self.frame.size.height);
    self.logoLabel.frame = CGRectMake(self.frame.size.height+10, 0, self.frame.size.width-(self.frame.size.height), self.frame.size.height);
}

@end
