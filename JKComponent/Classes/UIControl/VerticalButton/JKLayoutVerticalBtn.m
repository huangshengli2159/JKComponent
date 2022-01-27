//
//  JKLayoutVerticalBtn.m
//  Jeetuok
//
//  Created by sl on 2022/1/27.
//

#import "JKLayoutVerticalBtn.h"

@implementation JKLayoutVerticalBtn

- (instancetype)init {
    if (self = [super init]) {
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.verticSpacing = 0;
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat textH = [self.titleLabel sizeThatFits:CGSizeMake(self.frame.size.width, self.frame.size.height)].height;
    CGRect frame = self.titleLabel.frame;
    frame.size.height = textH;
    self.titleLabel.frame = frame;
    
    CGFloat totalH = self.imageView.frame.size.height + self.titleLabel.frame.size.height + self.verticSpacing;
    CGFloat startY = 0;
    if (self.contentVerticalAlignment != UIControlContentVerticalAlignmentTop) {
        startY = self.frame.size.height *.5 - totalH *.5;
    }
    
    self.imageView.frame = CGRectMake(self.frame.size.width *.5 - self.imageView.frame.size.width *.5, startY, self.imageView.frame.size.width, self.imageView.frame.size.height);
    self.titleLabel.frame = CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height+self.verticSpacing, self.frame.size.width, self.titleLabel.frame.size.height);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
