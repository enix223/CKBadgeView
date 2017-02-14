//
//  UIView+Badge.h
//  Strawberry
//
//  Created by Enix Yu on 14/2/2017.
//  Copyright © 2017 RobotBros. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Badge)

/**
 * Add a red badge to the UIView with default setting.
 *
 * Default Setting: badge content = nil,
 *                  badge radius = 5,
 *                  badge color = [UIColor redColor],
 *                  offset = CGPointZero
 *
 * @param color: The color of the badge
 * @return None
 */
- (void)addBadge;

/**
 * Add a red badge to the UIView with given offset.
 *
 * Default Setting: badge content = nil,
 *                  badge radius = 5,
 *                  badge color = [UIColor redColor],
 *
 * @param color: The color of the badge
 * @return None
 */
- (void)addBadgeWithOffset:(CGPoint)offset;

/**
 * Add a badge to the UIView with given badge color.
 *
 * Default Setting: badge content = nil,
 *                  badge radius = 5,
 *                  offset = CGPointZero
 *
 * @param color: The color of the badge
 * @return None
 */
- (void)addBadgeWithColor:(UIColor *)color;

/**
 * Add a badge to the UIView with given content and color.
 *
 * Default Setting: badge radius = 5,
 *                  offset = CGPointZero
 *
 * @param content: The content to fill in the badge
 * @param color:   The color of the badge
 * @return None
 */
- (void)addBadgeWithContent:(NSString *)content
                 badgeColor:(UIColor *)color;

/**
 * Add a badge to the UIView with given content, color and offset.
 *
 * Default Setting: badge radius = 10, 
 *                  content font = HelveticaNeue, 
 *                  font size = 12.0
 *
 * @param content: The content to fill in the badge
 * @param color:   The color of the badge
 * @param offset:  The offset of the badge according to the top-right corner
 * @return None
 */
- (void)addBadgeWithContent:(NSString *)content
                 badgeColor:(UIColor *)color
                     offset:(CGPoint)offset;

/**
 * Add a badge to the UIView with customized settings.
 *
 * Default Setting: content font = HelveticaNeue,
 *                  content font size = 12.0
 *                  content color = [UIColor whiteColor]
 *
 * @param content:      The content to fill in the badge
 * @param color:        The color of the badge
 * @param offset:       The offset of the badge according to the top-right corner
 * @param badgeRadius:  The radius of the badge
 * @return None
 */
- (void)addBadgeWithContent:(NSString * _Nullable)content
                 badgeColor:(UIColor * _Nullable)color
                     offset:(CGPoint)offset
                badgeRadius:(CGFloat)badgeRadius;


/**
 * Add a badge to the UIView with customized settings.
 *
 * @param content:      The content to fill in the badge
 * @param contentFont:  The font for the content
 * @param contentColor: The color for the content
 * @param color:        The color of the badge
 * @param offset:       The offset of the badge according to the top-right corner
 * @param badgeRadius:  The radius of the badge
 * @return None
 */
- (void)addBadgeWithContent:(NSString * _Nullable)content
                contentFont:(UIFont * _Nullable)contentFont
               contentColor:(UIColor * _Nullable)contentColor
                 badgeColor:(UIColor * _Nullable)color
                     offset:(CGPoint)offset
                badgeRadius:(CGFloat)badgeRadius;

/**
 * Remove the badge from the UIView
 *
 * @param   None
 * @return  None
 */
- (void)removeBadge;

NS_ASSUME_NONNULL_END

@end
