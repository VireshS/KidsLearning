
import Foundation
import UIKit

@objc extension UIView
{
    func addShadow(with color:UIColor)
    {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = CGSize(width: 4, height: 4)
        self.layer.shadowRadius = 1
        
        //self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        //self.layer.shouldRasterize = true
        //self.layer.rasterizationScale = UIScreen.main.scale
    }
}
@objc extension UIColor
{

    //MARK: HEX to UIColor
    convenience init(red: Int, green: Int, blue: Int)
    {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexCode:Int)
    {
        self.init(red:(hexCode >> 16) & 0xff, green:(hexCode >> 8) & 0xff, blue:hexCode & 0xff)
    }
    
    
    //MARK: DLS HEX Colors
    public class func ISPSepratorColor()->UIColor
    {
        return UIColor.DisabledLightThemeGreyColor()
    }
    public class func ISPDarkThemePrimaryGrey()->UIColor
    {
        return UIColor.ISPGray()
    }
    public class func ISPDarkThemeSecondaryGrey()->UIColor
    {
        return UIColor(hexCode:0x707070)
    }
    public class func ISPPlaceHolderTextColor()->UIColor
    {
        return UIColor(hexCode:0xB0B0B0)
    }
    public class func ISPLightThemePrimaryGrey()->UIColor
    {
        return UIColor(hexCode:0x303030)
    }
    public class func ISPLightThemeSecondaryGrey()->UIColor
    {
        return UIColor(hexCode:0x606060)
    }
    
    public class func DisabledLightThemeGreyColor()->UIColor
    {
        return UIColor(hexCode: 0xe0e0e0)
    }
    public class func DisabledDarkThemeGreyColor()->UIColor
    {
        return UIColor(hexCode: 0x404040)
    }
    
    public class func ISPErrorDarkGray()->UIColor
    {
        return UIColor(hexCode: 0x323232)
    }
    public class func ISPDarkGray()->UIColor
    {
        return UIColor(hexCode: 0x707070)
    }
    public class func ISPHighlightGreyColor()->UIColor
    {
        return UIColor(hexCode:0xc0c0c0)
    }
    public class func ISPMediumGray()->UIColor
    {
        return UIColor(hexCode: 0xd3d3d3)
    }
    public class func ISPGray()->UIColor
    {
        return UIColor(hexCode: 0xD0D0D0)
    }
    public class func ISPTableHeaderGray()->UIColor
    {
        return UIColor(hexCode:0xEFEFEF)
    }
    public class func ISPDarkThemePrimaryWhite()->UIColor
    {
        return UIColor(hexCode: 0xFFFFFF)
    }
    public class func ISPErrorRedColor()->UIColor
    {
        return UIColor(hexCode: 0xEE3124)
    }
    public class func ISPBlue()->UIColor
    {
        return UIColor(hexCode: 0x1792E5)
    }
    public class func ISPAlarmSeverityCriticalColor()->UIColor
    {
        return UIColor(hexCode: 0xF12E14)
    }
    public class func ISPAlarmSeverityMajorColor()->UIColor
    {
        return UIColor(hexCode: 0xF37021)
    }
    public class func ISPAlarmSeverityModerateColor() -> UIColor
    {
        return UIColor(hexCode: 0xFFB900)
    }
    public class func ISPAlarmSeverityNormalColor() -> UIColor
    {
        return UIColor(hexCode: 0xAF7AC5)
    }
    public class func ISPViewerBackgroundColor()->UIColor
    {
        return UIColor(hexCode: 0x202020) 
    }
    public class func ISPRed()->UIColor
    {
        return UIColor(hexCode: 0xee3154)  
    }
    public class func ISPDarkRed()->UIColor
    {
        return UIColor(hexCode: 0xed3023)
    }
    public class func ISPLightGreenColor()->UIColor
    {
        return UIColor(hexCode: 0x7eb338)
    }
    public class func ISPGreen()->UIColor
    {
        return UIColor(hexCode: 0x98c260)
    }
    public class func ISPLabelLightGray()->UIColor
    {
        return UIColor(hexCode: 0x909090)
    }
    public class func ISPExpiresTextRedColor() -> UIColor
    {
        return UIColor(hexCode: 0xc83a24)
    }
    public class func ISPLightYellowColor() -> UIColor
    {
        return UIColor(hexCode: 0xfff3d3)
    }
    public class func ISPDarkYellowColor() -> UIColor
    {
        return UIColor(hexCode: 0xffd867)
    }
    public class func ISPImageTextLabelBackgroundColor() -> UIColor
    {
        return UIColor(hexCode: 0xf0f0f0)
    }
    public class func ISPTableHeaderBackgroundColor() -> UIColor
    {
        return UIColor(hexCode: 0xD4D4D4)
    }
    public class func ISPDarkThemeBackgroundColor() -> UIColor
    {
        return UIColor(hexCode: 0x151515)
    }
    
    //MARK: DLS RGB Colors
    public class func ISPOverlayBackgroundColor()->UIColor
    {
        return UIColor(red:0.0/255.0 , green:0.0/255.0, blue:0.0/255.0, alpha:0.64)
    }
    
    //MARK: DLS Default Colors
    public class func ISPWhite()->UIColor
    {
        return UIColor.white
    }
    public class func ISPBlack()->UIColor
    {
        return UIColor.black
    }
    public class func ISPClear()->UIColor
    {
        return UIColor.clear
    }
    public class func ISPWhiteSmoke()->UIColor
    {
        return UIColor(hexCode: 0xF2F2F2)
    }
}
