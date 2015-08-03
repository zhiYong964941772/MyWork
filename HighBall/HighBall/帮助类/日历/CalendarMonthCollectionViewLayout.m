//
//  ETIAgendaMonthCollectionViewLayout.m
//  CalendarIOS7
//


#import "CalendarMonthCollectionViewLayout.h"
#import "CalendarMonthHeaderView.h"

@interface CalendarMonthCollectionViewLayout ()
@end

@implementation CalendarMonthCollectionViewLayout

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        NSString *dev=[UIDevice currentDevice].model;
        NSLog(@"%@",dev);
        if ([dev isEqualToString:@"iPhone4,2"]||[dev isEqualToString:@"iPhone5,1"]||[dev isEqualToString:@"iPhone5,2"]||[dev isEqualToString:@"iPhone5,3"]) {
            self.headerReferenceSize = CGSizeMake(320.f, 65.0f);//头部视图的框架大小
            self.itemSize = CGSizeMake(320/7, 70.0f);//每个cell的大小
        }else if ([dev isEqualToString:@"iPhone6,1"])
        {
            self.headerReferenceSize = CGSizeMake(375.f, 65.0f);//头部视图的框架大小
            self.itemSize = CGSizeMake(375/7, 70.0f);//每个cell的大小
        }else if ([dev isEqualToString:@"iPhone6,2"])
        {
            self.headerReferenceSize = CGSizeMake(400.f, 65.0f);//头部视图的框架大小
            self.itemSize = CGSizeMake(400/7, 70.0f);//每个cell的大小
        }else if ([dev isEqualToString:@"iPhone Simulator"])
        {
            self.headerReferenceSize = CGSizeMake(320.f, 65.0f);//头部视图的框架大小
            self.itemSize = CGSizeMake(320/7, 70.0f);//每个cell的大小
        }
        
        self.minimumLineSpacing = 0.0f;//每行的最小间距
        
        self.minimumInteritemSpacing = 0.0f;//每列的最小间距
        
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);//网格视图的/上/左/下/右,的边距
    }
    
    return self;
}

- (NSArray *) layoutAttributesForElementsInRect:(CGRect)rect {
    
    NSMutableArray *answer = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    UICollectionView * const cv = self.collectionView;
    CGPoint const contentOffset = cv.contentOffset;
    
    NSMutableIndexSet *missingSections = [NSMutableIndexSet indexSet];
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        if (layoutAttributes.representedElementCategory == UICollectionElementCategoryCell) {
            [missingSections addIndex:layoutAttributes.indexPath.section];
        }
    }
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            [missingSections removeIndex:layoutAttributes.indexPath.section];
        }
    }
    
    [missingSections enumerateIndexesUsingBlock:^(NSUInteger idx, BOOL *stop) {
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:0 inSection:idx];
        
        UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:indexPath];
        
        [answer addObject:layoutAttributes];
        
    }];
    
    for (UICollectionViewLayoutAttributes *layoutAttributes in answer) {
        
        if ([layoutAttributes.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
            
            NSInteger section = layoutAttributes.indexPath.section;
            NSInteger numberOfItemsInSection = [cv numberOfItemsInSection:section];
            
            NSIndexPath *firstObjectIndexPath = [NSIndexPath indexPathForItem:0 inSection:section];
            NSIndexPath *lastObjectIndexPath = [NSIndexPath indexPathForItem:MAX(0, (numberOfItemsInSection - 1)) inSection:section];
            
            UICollectionViewLayoutAttributes *firstObjectAttrs;
            UICollectionViewLayoutAttributes *lastObjectAttrs;
            
            if (numberOfItemsInSection > 0) {
                firstObjectAttrs = [self layoutAttributesForItemAtIndexPath:firstObjectIndexPath];
                lastObjectAttrs = [self layoutAttributesForItemAtIndexPath:lastObjectIndexPath];
            } else {
                firstObjectAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                                                                        atIndexPath:firstObjectIndexPath];
                lastObjectAttrs = [self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionFooter
                                                                       atIndexPath:lastObjectIndexPath];
            }
            
            CGFloat headerHeight = CGRectGetHeight(layoutAttributes.frame);
            CGPoint origin = layoutAttributes.frame.origin;
            origin.y = MIN(
                           MAX(
                               contentOffset.y + cv.contentInset.top,
                               (CGRectGetMinY(firstObjectAttrs.frame) - headerHeight)
                               ),
                           (CGRectGetMaxY(lastObjectAttrs.frame) - headerHeight)
                           );
            
            layoutAttributes.zIndex = 1024;
            layoutAttributes.frame = (CGRect){
                .origin = origin,
                .size = layoutAttributes.frame.size
            };
            
        }
        
    }
    
    return answer;
    
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBound {
    
    return YES;
    
}


@end
