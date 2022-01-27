//
//  JKBaseViewController.h
//  Jeetuok
//
//  Created by sl on 2022/1/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKBaseViewController : UIViewController

@property (nonatomic, strong) UIView *navBar;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *navTitle;
@property (nonatomic, strong) UIView *navLine;

@property (nonatomic, copy) void(^baseBackBlock)(void);

+ (UIViewController *)topViewController;

@end

NS_ASSUME_NONNULL_END
