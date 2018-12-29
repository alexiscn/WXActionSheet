//
//  WXActionSheetItem.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2018/12/26.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit

public class WXActionSheetItem {
    
    public enum ItemType {
        case `default`
        case destructive
        case cancel
    }
    
    public var title: String?
    public var imageEdgeInsets: UIEdgeInsets = .zero
    public var titleEdgeInsets: UIEdgeInsets = .zero
    public var fontSize: CGFloat = 15
    public var titleColor: UIColor = .black
    
    public var type: ItemType = .default
    
    public init(title: String, type: ItemType = .default) {
        self.title = title
        self.type = type
    }
    
    public init(title: String, fontSize: CGFloat = 15.0, titleColor: UIColor = UIColor.black) {
        self.title = title
        self.fontSize = fontSize
        self.titleColor = titleColor
    }
    
}
