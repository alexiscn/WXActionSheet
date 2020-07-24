//
//  WXActionSheetStyle.swift
//  WXActionSheet
//
//  Created by xu.shuifeng on 2020/6/19.
//

import Foundation


/// Style fotr WXActionSheet.
public enum WXActionSheetStyle {
    
    /// The system style. avaiable at iOS 13.0
    @available(iOS 13, *)
    case system
    /// The light style.
    case light
    /// The dark style.
    case dark
    /// The custom style.
    case custom(Appearance)
    
    var appearance: Appearance {
        switch self {
        case .system:
            if #available(iOS 12, *) {
                let userInterfaceStyle = UIScreen.main.traitCollection.userInterfaceStyle
                return userInterfaceStyle == .light ? WXActionSheetStyle.lightAppearance: WXActionSheetStyle.darkappearance
            }
            return WXActionSheetStyle.lightAppearance
        case .light:
            return WXActionSheetStyle.lightAppearance
        case .dark:
            return WXActionSheetStyle.darkappearance
        case .custom(let appearance):
            return appearance
        }
    }
    
    public static var lightAppearance: Appearance = {
        var appearance = Appearance()
        appearance.buttonHeight = 56.0
        appearance.buttonNormalBackgroundColor = UIColor(white: 1, alpha: 1)
        appearance.buttonHighlightBackgroundColor = UIColor(white: 248.0/255, alpha: 1)
        appearance.destructiveButtonTitleColor = UIColor.red
        // TODO
        return appearance
    }()
    
    public static var darkappearance: Appearance = {
        var appearance = Appearance()
        // TODO
        appearance.effect = UIBlurEffect(style: .dark)
        return appearance
    }()
}

public extension WXActionSheetStyle {
    
    struct Appearance {
        
        /// The height of button.
        public var buttonHeight: CGFloat = 56.0
        
        public var buttonNormalBackgroundColor = UIColor(white: 1, alpha: 1)
        
        public var buttonHighlightBackgroundColor = UIColor(white: 248.0/255, alpha: 1)
        
        /// Title color for normal buttons, default to UIColor.black
        public var buttonTitleColor = UIColor.black
        
        /// Title color for destructive button, default to UIColor.red
        public var destructiveButtonTitleColor = UIColor.red
        
        /// Separator backgroundColor between CancelButton and other buttons
        public var separatorColor = UIColor(white: 242.0/255, alpha: 1.0)
        
        public var enableBlurEffect = true
        
        public var effect: UIVisualEffect = UIBlurEffect(style: .light)
        
        public init() { }
    }
}
