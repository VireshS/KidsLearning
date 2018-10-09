

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, CustomHeaderFooterViewStyle) {
    CustomHeaderFooterViewStyleDefault,
    CustomHeaderFooterViewStyleCenter,
};

@interface CustomHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, weak) IBOutlet UIView *mainContentView;
@property (nonatomic, weak) IBOutlet UILabel *headerTitleLabel;
@property (nonatomic, weak) IBOutlet UIView *dividerView;
-(void)centerStyle;
@end
