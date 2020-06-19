//
//  Style.swift
//  WXActionSheet
//
//  Created by xu.shuifeng on 2020/6/19.
//

import Foundation

extension WXActionSheet {
    
    public enum Style {
        case light
        case dark
        case custom(Appearance)
        
        var appearance: Appearance {
            switch self {
            case .light:
                return lightAppearance()
            case .dark:
                return darkappearance()
            case .custom(let appearance):
                return appearance
            }
        }
        
        private func lightAppearance() -> Appearance {
            var appearance = Appearance()
            appearance.buttonHeight = 56.0
            appearance.buttonNormalBackgroundColor = UIColor(white: 1, alpha: 1)
            appearance.buttonHighlightBackgroundColor = UIColor(white: 248.0/255, alpha: 1)
            // TODO
            return appearance
        }
        
        private func darkappearance() -> Appearance {
            var appearance = Appearance()
            // TODO
            appearance.effect = UIBlurEffect(style: .dark)
            return appearance
        }
        
    }
    
    public struct Appearance {
        
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
        
        public init() {
            
        }
        
    }
}
