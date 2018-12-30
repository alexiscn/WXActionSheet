//
//  WXActionSheet.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2018/12/26.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit

@objc
public protocol WXActionSheetDelegate: class {
 
    /// User tapped cancel button
    ///
    /// - Parameter actionSheet: actionSheet
    @objc optional func actionSheetCancel(_ actionSheet: WXActionSheet)
    
    /// User tapped outside to dismiss WXActionSheet
    ///
    /// - Parameter actionSheet: actionSheet
    @objc optional func actionSheetTapOutside(_ actionSheet: WXActionSheet)
    
    /// User tapped button event
    ///
    /// - Parameters:
    ///   - actionSheet: actionSheet
    ///   - index: button index
    @objc optional func actionSheet(_ actionSheet: WXActionSheet, clickedButtonAtIndex index: Int)
}

public class WXActionSheet: UIView {
    
    /// WXActionSheet defaults, you can override it globally
    public struct Preferences {
        
        /// Height for buttons, defaults 50.0
        public static var ButtonHeight: CGFloat = 50.0
        
        public static var ButtonNormalBackgroundColor = UIColor(white: 1, alpha: 0.7)
        
        public static var ButtonHighlightBackgroundColor = UIColor(white: 1, alpha: 0.5)
        
        /// Title color for normal buttons, default to UIColor.black
        public static var ButtonTitleColor = UIColor.black
        
        /// Title color for destructive button, default to UIColor.red
        public static var DestructiveButtonTitleColor = UIColor.red
        
        /// Separator backgroundColor between CancelButton and other buttons
        public static var SeparatorColor = UIColor(white: 153.0/255, alpha: 1.0)
    }
 
    public weak var delegate: WXActionSheetDelegate?
    
    public var name: String? = nil
    
    private let containerView = UIView()
    private let backgroundView = UIView()
    private var items: [WXActionSheetItem] = []
    private let LineHeight: CGFloat = 1.0/UIScreen.main.scale
    
    public init(title: String?, delegate: WXActionSheetDelegate, cancelButtonTitle: String, buttonTitles: [String]) {
        let frame = UIScreen.main.bounds
        super.init(frame: frame)
        self.delegate = delegate
        items = buttonTitles.map { return WXActionSheetItem(title: $0) }
        items.append(WXActionSheetItem(title: cancelButtonTitle))
        commonInit()
    }
    
    public convenience init(delegate: WXActionSheetDelegate, cancelButtonTitle: String, buttonTitles: String...) {
        self.init(title: nil, delegate: delegate, cancelButtonTitle: cancelButtonTitle, buttonTitles: buttonTitles)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    public func show() {
        let windows = UIApplication.shared.windows.filter { NSStringFromClass($0.classForCoder) != "UIRemoteKeyboardWindow" }
        guard let win = windows.last else { return }
        buildUI()
        UIView.animate(withDuration: 0.1, animations: {
            win.addSubview(self)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.backgroundView.alpha = 1.0
                let y = self.bounds.height - self.containerView.frame.height
                self.containerView.frame.origin = CGPoint(x: 0, y: y)
            }
        }
    }
    
    func hide() {
        UIView.animate(withDuration: 0.3, animations: {
            self.backgroundView.alpha = 0.0
            let y = UIScreen.main.bounds.height
            self.containerView.frame.origin = CGPoint(x: 0, y: y)
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    public func appendButton(title: String) {
        items.append(WXActionSheetItem(title: title))
    }
    
    public func appendDestructiveButton(title: String) {
        items.append(WXActionSheetItem(title: title, type: .default))
    }
}


// MARK: - Private Methods
extension WXActionSheet {
    
    private func commonInit() {
        
        backgroundView.frame = bounds
        backgroundView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        tapGesture.delegate = self
        backgroundView.addGestureRecognizer(tapGesture)
        addSubview(backgroundView)
        
        containerView.backgroundColor = .clear
        addSubview(containerView)
    }
    
    @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        let point = gesture.location(in: backgroundView)
        if !containerView.frame.contains(point) {
            hide()
        }
    }
    
    private func buildUI() {
        
        let highlightBackgroundImage = UIImage.imageWithColor(Preferences.ButtonHighlightBackgroundColor)
        let nomalBackgroundImage = UIImage.imageWithColor(Preferences.ButtonNormalBackgroundColor)
        var y: CGFloat = 0.0
        let x = bounds.minX
        let width = bounds.width
        var height = Preferences.ButtonHeight
        
        for (index, item) in items.enumerated() {
            let button = UIButton(type: .custom)
            button.tag = index
            button.backgroundColor = .clear
            button.setBackgroundImage(nomalBackgroundImage, for: .normal)
            button.setBackgroundImage(highlightBackgroundImage, for: .highlighted)
            button.setTitle(item.title, for: .normal)
            button.setTitleColor(item.titleColor, for: .normal)
            if index == items.count - 1 {
                let separator = UIView(frame: CGRect(x: 0, y: y , width: width, height: 5.0))
                separator.backgroundColor = Preferences.SeparatorColor
                containerView.addSubview(separator)
                
                y += 5.0
                height = Preferences.ButtonHeight + safeInsets.bottom
                button.titleEdgeInsets = UIEdgeInsets(top: -safeInsets.bottom/2.0, left: 0, bottom: 0, right: 0)
            }
            button.frame = CGRect(x: x, y: y, width: width, height: height)
            containerView.addSubview(button)
            button.addTarget(self, action: #selector(handleButtonTapped(_:)), for: .touchUpInside)
            
            if index == items.count - 1 || index == items.count - 2 {
                y += height
            } else {
                y += height + LineHeight
            }
        }
        
        containerView.frame = CGRect(x: x, y: bounds.height, width: width, height: y)
        
        let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        effectView.frame = containerView.bounds
        containerView.addSubview(effectView)
        containerView.sendSubviewToBack(effectView)
    }
    
    fileprivate var safeInsets: UIEdgeInsets {
        return UIApplication.shared.keyWindow?.safeAreaInsets ?? .zero
    }
    
    @objc private func handleButtonTapped(_ sender: UIButton) {
        let index = sender.tag
        delegate?.actionSheet?(self, clickedButtonAtIndex: index)
        hide()
    }
}

// MARK: - UIGestureRecognizerDelegate
extension WXActionSheet: UIGestureRecognizerDelegate {
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if touch.view == self.containerView {
            return false
        }
        return true
    }
}

fileprivate extension UIImage {
    
    class func imageWithColor(_ color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
