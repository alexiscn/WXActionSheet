//
//  WXScrollableActionItem.swift
//  WXActionSheet
//
//  Created by xu.shuifeng on 2020/6/19.
//

import UIKit

public class WXScrollableActionItem {
    
    public let identifier: String
    
    public var title: String
    
    public var titleColor: UIColor? = nil
    
    public var icon: UIImage?
    
    public init(identifier: String, title: String, icon: UIImage?) {
        self.identifier = identifier
        self.title = title
        self.icon = icon
    }
}
