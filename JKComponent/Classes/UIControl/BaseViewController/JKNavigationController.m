//
//  JKNavigationController.m
//  Jeetuok
//
//  Created by sl on 2022/1/18.
//

#import "JKNavigationController.h"

@interface JKNavigationController ()

@end

@implementation JKNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //如果现在push的不是栈底控制器（最先push进来的那个控制器）
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated {
    if (self.viewControllers.count == 1) {
        [self dismissViewControllerAnimated:animated completion:nil];
        return self.viewControllers.lastObject;
    } else {
        return [super popViewControllerAnimated:animated];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
