//
//  LdzfIrregularElementsCreator.m
//  CRJGeneralTools_Example
//
//  Created by zhuyuhui on 2020/9/12.
//  Copyright © 2020 zhuyuhui434@gmail.com. All rights reserved.
//

#import "LdzfIrregularElementsCreator.h"

@interface LdzfIrregularElementsCreator ()

@property (nonatomic)         CGFloat              areaHeight;
@property (nonatomic, strong) NSArray <NSValue *> *itemFrames;

@end

@implementation LdzfIrregularElementsCreator

- (void)startCreateElementsFrames {
    
    CGFloat maxWidth   = self.areaWidth - (self.edgeInsets.left + self.edgeInsets.right);
    CGFloat hrGap      = self.itemHorizontalGap;
    CGFloat vtGap      = self.itemVerticalGap;
    CGFloat itemHeight = self.itemHeight;
    
    __block NSInteger totalRow = 0;
    
    NSMutableArray <NSValue *> *itemsFrames = [NSMutableArray array];
    
    if /* 从左往右,从上往下排列 */ (self.isRightToLeft == NO) {
        
        __block CGFloat offsetX  = self.edgeInsets.left;
        __block CGFloat offsetY  = self.edgeInsets.top;
        
        [self.itemWidths enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGFloat itemWidth = obj.floatValue;
            
            if (offsetX + itemWidth - self.edgeInsets.left <= maxWidth) {
                
                [itemsFrames addObject:[NSValue valueWithCGRect:CGRectMake(offsetX, offsetY, itemWidth, itemHeight)]];
                offsetX = offsetX + itemWidth + hrGap;
                
            } else {
                
                totalRow = totalRow + 1;
                offsetX  = self.edgeInsets.left;
                offsetY  = offsetY + itemHeight + vtGap;
                
                [itemsFrames addObject:[NSValue valueWithCGRect:CGRectMake(offsetX, offsetY, itemWidth, itemHeight)]];
                offsetX = offsetX + itemWidth + hrGap;
            }
        }];
        
        offsetY        += itemHeight + self.edgeInsets.bottom;
        self.areaHeight = offsetY;
        self.itemFrames = itemsFrames;
        
    } /* 从右往左,从上往下排列 */ else if (self.isRightToLeft == YES) {
        
        __block CGFloat offsetX = self.areaWidth - self.edgeInsets.right;
        __block CGFloat offsetY = self.edgeInsets.top;
        
        [self.itemWidths enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            CGFloat itemWidth = obj.floatValue;
            
            if (offsetX - itemWidth >= self.edgeInsets.left) {
                
                [itemsFrames addObject:[NSValue valueWithCGRect:CGRectMake(offsetX - itemWidth, offsetY, itemWidth, itemHeight)]];
                offsetX = offsetX - itemWidth - hrGap;
                
            } else {
                
                totalRow = totalRow + 1;
                offsetX  = self.areaWidth - self.edgeInsets.right;
                offsetY  = offsetY + itemHeight + vtGap;
                
                [itemsFrames addObject:[NSValue valueWithCGRect:CGRectMake(offsetX - itemWidth, offsetY, itemWidth, itemHeight)]];
                offsetX = offsetX - itemWidth - hrGap;
            }
        }];
        
        offsetY        += itemHeight + self.edgeInsets.bottom;
        self.areaHeight = offsetY;
        self.itemFrames = itemsFrames;
    }
    
    // 从下往上排序
    if (self.isBottomToTop == YES) {
        
        NSMutableArray *tmpItemsFrames = [NSMutableArray array];
        CGFloat         firstItemY     = itemsFrames.firstObject.CGRectValue.origin.y;
        
        [itemsFrames enumerateObjectsUsingBlock:^(NSValue * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            NSInteger currentRow = (NSInteger)floor(obj.CGRectValue.origin.y / (itemHeight + vtGap));
            CGRect    rect       = CGRectMake(obj.CGRectValue.origin.x, obj.CGRectValue.origin.y, obj.CGRectValue.size.width, obj.CGRectValue.size.height);
            CGFloat   newY       = firstItemY + (totalRow - currentRow) * (itemHeight + vtGap);
            rect.origin          = CGPointMake(rect.origin.x, newY);
            [tmpItemsFrames addObject:[NSValue valueWithCGRect:rect]];
        }];
        
        self.itemFrames = tmpItemsFrames;
    }
}

#pragma mark - 便利构造器

+ (instancetype)irregularElementsCreatorWithItemIsRightToLeft:(BOOL)isRightToLeft
                                                isBottomToTop:(BOOL)isBottomToTop
                                                    areaWidth:(CGFloat)areaWidth
                                                   edgeInsets:(UIEdgeInsets)edgeInsets
                                            itemHorizontalGap:(CGFloat)itemHorizontalGap
                                              itemVerticalGap:(CGFloat)itemVerticalGap
                                                   itemHeight:(CGFloat)itemHeight
                                                   itemWidths:(NSArray <NSNumber *> *)itemWidths {
    
    LdzfIrregularElementsCreator *creator = [LdzfIrregularElementsCreator new];
    creator.isRightToLeft             = isRightToLeft;
    creator.isBottomToTop             = isBottomToTop;
    creator.areaWidth                 = areaWidth;
    creator.edgeInsets                = edgeInsets;
    creator.itemHorizontalGap         = itemHorizontalGap;
    creator.itemVerticalGap           = itemVerticalGap;
    creator.itemHeight                = itemHeight;
    creator.itemWidths                = itemWidths;
    
    return creator;
}

+ (void)irregularElementsCreatorWithItemIsRightToLeft:(BOOL)isRightToLeft
                                        isBottomToTop:(BOOL)isBottomToTop
                                            areaWidth:(CGFloat)areaWidth
                                           edgeInsets:(UIEdgeInsets)edgeInsets
                                    itemHorizontalGap:(CGFloat)itemHorizontalGap
                                      itemVerticalGap:(CGFloat)itemVerticalGap
                                           itemHeight:(CGFloat)itemHeight
                                           itemWidths:(NSArray <NSNumber *> *)itemWidths
                                              results:(void (^)(CGFloat areaHeight, NSArray <NSValue *> *itemFrames))results {
    
    LdzfIrregularElementsCreator *creator = [LdzfIrregularElementsCreator irregularElementsCreatorWithItemIsRightToLeft:isRightToLeft
                                                                                                  isBottomToTop:isBottomToTop
                                                                                                      areaWidth:areaWidth
                                                                                                     edgeInsets:edgeInsets
                                                                                              itemHorizontalGap:itemHorizontalGap
                                                                                                itemVerticalGap:itemVerticalGap
                                                                                                     itemHeight:itemHeight
                                                                                                     itemWidths:itemWidths];
    [creator startCreateElementsFrames];
    if (results) {
        
        results(creator.areaHeight, creator.itemFrames);
    }
}

@end
