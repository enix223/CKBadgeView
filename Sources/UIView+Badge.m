//
//  UIView+Badge.m
//  Strawberry
//
//  Created by Enix Yu on 14/2/2017.
//  Copyright © 2017 RobotBros. All rights reserved.
//

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>

#import "UIView+Badge.h"

#define CV_BADGE_DEFAULT_CONTENT_FONT_SIZE          12.0
#define CV_BADGE_DEFAULT_FONT_NAME                  @"HelveticaNeue"
#define CV_BADGE_DEFAULT_NONEMPTY_CONTENT_RADIUS    10.0
#define CV_BADGE_DEFAULT_EMPTY_CONTENT_RADIUS       5.0

static char * const kUIViewBadgePropertyKey =  "badgeLayer";

@implementation UIView (Badge)

- (void)addBadgeWithContent:(NSString * _Nullable)content
                contentFont:(UIFont * _Nullable)contentFont
               contentColor:(UIColor * _Nullable)contentColor
                 badgeColor:(UIColor * _Nullable)color
                     offset:(CGPoint)offset
                badgeRadius:(CGFloat)badgeRadius {
    
    self.layer.masksToBounds = NO;
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    CGPoint center = CGPointMake(badgeRadius, badgeRadius);
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:center
                                                              radius:badgeRadius
                                                          startAngle:0.0
                                                            endAngle:2*M_PI
                                                           clockwise:YES];
    circleLayer.path = circlePath.CGPath;
    circleLayer.fillColor = color.CGColor;
    circleLayer.contentsScale = [UIScreen mainScreen].scale;
    circleLayer.frame = CGRectMake(CGRectGetWidth(self.frame) - badgeRadius + offset.x,
                                   -badgeRadius + offset.y,
                                   2 * badgeRadius,
                                   2 * badgeRadius);
    
    [self.layer addSublayer:circleLayer];
    
    // Bind the badge layer to the current view
    objc_setAssociatedObject(self,
                             kUIViewBadgePropertyKey,
                             circleLayer,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // Add content layer if content not null
    if (content != nil) {
        circleLayer.masksToBounds = YES;
        
        CATextLayer *textLayer = [CATextLayer layer];
        textLayer.foregroundColor = [UIColor whiteColor].CGColor;
        textLayer.alignmentMode = kCAAlignmentCenter;
        textLayer.wrapped = YES;
        textLayer.contentsScale = [UIScreen mainScreen].scale;
        
        // How to make CATextLayer vertical align
        // @see http://stackoverflow.com/questions/12567562/unwanted-vertical-padding-from-ios-6-on-catextlayer/12964973#12964973
        // @see http://stackoverflow.com/questions/18122027/how-to-set-catextlayer-text-vertical-position/18124362#18124362
        CGFloat offsetY = (contentFont.capHeight - contentFont.xHeight);
        textLayer.frame = CGRectMake(0,
                                     offsetY,
                                     CGRectGetWidth(circleLayer.bounds),
                                     CGRectGetHeight(circleLayer.bounds));
        
        CFStringRef fontName = (__bridge CFStringRef)(contentFont.fontName);
        CGFontRef fontRef = CGFontCreateWithFontName(fontName);
        textLayer.font = fontRef;
        textLayer.fontSize = contentFont.pointSize;
        CGFontRelease(fontRef);
        textLayer.string = content;
        [circleLayer addSublayer:textLayer];
    }
}

- (void)addBadgeWithContent:(NSString *)content
                 badgeColor:(UIColor *)color
                     offset:(CGPoint)offset
                badgeRadius:(CGFloat)badgeRadius {
    
    UIFont *font = [UIFont fontWithName:CV_BADGE_DEFAULT_FONT_NAME
                                   size:CV_BADGE_DEFAULT_CONTENT_FONT_SIZE];
    [self addBadgeWithContent:content
                  contentFont:font
                 contentColor:[UIColor whiteColor]
                   badgeColor:color
                       offset:offset
                  badgeRadius:badgeRadius];
}

- (void)removeBadge {
    // Retrieve the badge layer to the current view
    CAShapeLayer *badgeLayer = objc_getAssociatedObject(self, kUIViewBadgePropertyKey);
    if (badgeLayer == nil) return;
    [badgeLayer removeFromSuperlayer];
    badgeLayer = nil;
    
    // Un-Bind the badge layer to the current view
    objc_setAssociatedObject(self,
                             kUIViewBadgePropertyKey,
                             nil,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)addBadge {
    [self addBadgeWithContent:nil
                   badgeColor:[UIColor redColor]
                       offset:CGPointZero
                  badgeRadius:CV_BADGE_DEFAULT_EMPTY_CONTENT_RADIUS];
}

- (void)addBadgeWithOffset:(CGPoint)offset {
    [self addBadgeWithContent:nil
                   badgeColor:[UIColor redColor]
                       offset:offset
                  badgeRadius:CV_BADGE_DEFAULT_EMPTY_CONTENT_RADIUS];
}

- (void)addBadgeWithColor:(UIColor *)color {
    [self addBadgeWithContent:nil
                   badgeColor:color
                       offset:CGPointZero
                  badgeRadius:CV_BADGE_DEFAULT_EMPTY_CONTENT_RADIUS];
}

- (void)addBadgeWithContent:(NSString *)content
      badgeColor:(UIColor *)color {
    
    [self addBadgeWithContent:content
                   badgeColor:color
                       offset:CGPointZero
                  badgeRadius:CV_BADGE_DEFAULT_NONEMPTY_CONTENT_RADIUS];
}

- (void)addBadgeWithContent:(NSString *)content
                 badgeColor:(UIColor *)color
                     offset:(CGPoint)offset {
    
    [self addBadgeWithContent:content
                   badgeColor:color
                       offset:offset
                  badgeRadius:CV_BADGE_DEFAULT_NONEMPTY_CONTENT_RADIUS];
}

@end
