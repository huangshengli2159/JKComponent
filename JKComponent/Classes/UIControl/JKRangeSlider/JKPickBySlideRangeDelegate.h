//
//  JKPickBySlideRangeDelegate.h
//  Jeetuok
//
//  Created by sl on 2022/1/27.
//

#import <Foundation/Foundation.h>

@class JKPickBySlideRange;

@protocol JKPickBySlideRangeDelegate<NSObject>

@optional

/**
 * Called when the RangeSlider values are changed
 */
-(void)rangeSlider:(JKPickBySlideRange *)sender didChangeSelectedMinimumValue:(float)selectedMinimum andMaximumValue:(float)selectedMaximum;

/**
 * Called when the user has finished interacting with the RangeSlider
 */
- (void)didEndTouchesInRangeSlider:(JKPickBySlideRange *)sender;

/**
 * Called when the user has started interacting with the RangeSlider
 */
- (void)didStartTouchesInRangeSlider:(JKPickBySlideRange *)sender;

@end

