//
//  JKBaseViewController.m
//  Jeetuok
//
//  Created by sl on 2022/1/18.
//

#import "JKBaseViewController.h"

@interface JKMYView : UIView

@property (nonatomic, copy) void(^didAddSubviewBlock_JK)(void);

@end

@implementation JKMYView

- (void)didAddSubview:(UIView *)subview {
    [super didAddSubview:subview];
    
    if (self.didAddSubviewBlock_JK) {
        self.didAddSubviewBlock_JK();
    }
}

@end

@interface JKBaseViewController ()

@end

@implementation JKBaseViewController

- (void)loadView {
    JKMYView *view = JKMYView.new;
    view.frame = CGRectMake(0, 0, KSCREEN_W, kSCREEN_H);
    @ws
    view.didAddSubviewBlock_JK = ^{
        @ss
        [self.view bringSubviewToFront:self.navBar];
    };
    self.view = view;
}

- (instancetype)init {
    if (self = [super init]) {
        self.fd_prefersNavigationBarHidden = YES;
    }
    return self;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        self.fd_prefersNavigationBarHidden = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupNavBar];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    UIMenuController *controller = [UIMenuController sharedMenuController];
    if (controller) {
        [controller setMenuVisible:NO animated:YES];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

// 自定义导航栏
- (void)setupNavBar {
    CGFloat height = KJKNavAndStatusH;
    if (self.navigationController.presentingViewController &&
        self.navigationController.modalPresentationStyle != UIModalPresentationFullScreen &&
        self.navigationController.modalPresentationStyle != UIModalPresentationOverCurrentContext) {
        height = KJKNavBarH;
    }
    self.navBar = [UIView.alloc initWithFrame:CGRectMake(0, 0, KSCREEN_W, height)];
    self.navBar.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.navBar];
    
    self.navTitle = [UILabel.alloc initWithFrame:CGRectMake(60, self.navBar.my_height - KJKNavBarH, KSCREEN_W-120, KJKNavBarH)];
    self.navTitle.font = KFontSemiBold(19);
    self.navTitle.textAlignment = NSTextAlignmentCenter;
    self.navTitle.textColor = kColorText;
    [self.navBar addSubview:self.navTitle];

    self.backButton = [UIButton.alloc initWithFrame:CGRectMake(5, self.navBar.my_height - 2 - 44, 44, 44)];
    [self.backButton setImage:[UIImage imageNamed:@"nav_back_icon"] forState:UIControlStateNormal];
    [self.backButton addTarget:self action:@selector(onNavBack) forControlEvents:UIControlEventTouchUpInside];
    [self.navBar addSubview:self.backButton];
    
    if (self.navigationController.viewControllers.count <= 1) {
        self.backButton.hidden = YES;
    }
    
    self.navLine = [UIView.alloc initWithFrame:CGRectMake(0, self.navBar.my_height - 1, KSCREEN_W, 1)];
    self.navLine.backgroundColor = RGBClear;
    [self.navBar addSubview:self.navLine];
}

- (void)setTitle:(NSString *)title {
    self.navTitle.text = title;
}

- (void)onNavBack {
    if (self.baseBackBlock) {
        self.baseBackBlock();
    } else {
        if (self.navigationController) {
            if (self.navigationController.viewControllers.count == 1) {
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            } else {
                [self.navigationController popViewControllerAnimated:YES];
            }
        } else {
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
}

+ (UIViewController *)topViewController {
    __block UIViewController *resultVC;
    if ([NSThread currentThread].isMainThread) {
        resultVC = [JKBaseViewController getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
        while (resultVC.presentedViewController) {
            resultVC = [JKBaseViewController getTopViewController:resultVC.presentedViewController];
        }
    } else {
        dispatch_sync(dispatch_get_main_queue(), ^{
            resultVC = [JKBaseViewController getTopViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
            while (resultVC.presentedViewController) {
                resultVC = [JKBaseViewController getTopViewController:resultVC.presentedViewController];
            }
        });
    }
    
    return resultVC;
}

+ (UIViewController *)getTopViewController:(UIViewController *)targetVC {
    if ([targetVC isKindOfClass:[UINavigationController class]]) {
        return [JKBaseViewController getTopViewController:[(UINavigationController *)targetVC topViewController]];
    } else if ([targetVC isKindOfClass:[UITabBarController class]]) {
        return [JKBaseViewController getTopViewController:[(UITabBarController *)targetVC selectedViewController]];
    } else {
        return targetVC;
    }
    return nil;
}
@end
