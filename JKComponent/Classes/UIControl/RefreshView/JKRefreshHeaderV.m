//
//  JKRefreshHeaderV.m
//  Jeetuok
//
//  Created by sl on 2022/1/27.
//

#import "JKRefreshHeaderV.h"

@implementation JKRefreshHeaderV

+ (instancetype)headerWithRefreshingBlock:(MJRefreshComponentAction)refreshingBlock {
    JKRefreshHeaderV *header = [super headerWithRefreshingBlock:refreshingBlock];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    return header;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
