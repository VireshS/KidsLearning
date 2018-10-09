
#import "CustomHeaderFooterView.h"

@interface CustomHeaderFooterView ()

@property (nonatomic) CustomHeaderFooterViewStyle style;

@end

@implementation CustomHeaderFooterView

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dividerView.alpha                  = 0.0f;
    [self setupBasedOnStyle];
}



-(void)prepareForReuse
{
    [super prepareForReuse];
    
    [self setupBasedOnStyle];
}

-(void)setupBasedOnStyle {
    if(self.style == CustomHeaderFooterViewStyleCenter) {
        [self centerStyle];
    }
    else {
        [self defaultStyle];
    }
}

-(void)defaultStyle
{
    CGRect rect = self.headerTitleLabel.frame;
    rect.origin.y = self.headerTitleLabel.superview.frame.size.height-self.headerTitleLabel.bounds.size.height-3;
    self.headerTitleLabel.frame = rect;
    self.style = CustomHeaderFooterViewStyleDefault;
}

-(void)centerStyle
{
    CGRect rect = self.headerTitleLabel.frame;
    rect.origin.y = (self.headerTitleLabel.superview.frame.size.height-self.headerTitleLabel.bounds.size.height)/2;
    self.headerTitleLabel.frame = rect;
    self.style = CustomHeaderFooterViewStyleCenter;
}

@end
