//
//  WXScrollableActionSheet.swift
//  WXActionSheet
//
//  Created by xu.shuifeng on 2020/6/19.
//

import UIKit



public protocol WXScrollableActionSheetDelegate: class {
    
    func scrollableActionSheet(_ actionSheet: WXScrollableActionSheet, didSelectItem item: WXScrollableActionItem)
    
}


/// Scrollable ActionSheet.
public class WXScrollableActionSheet: UIView {
    
    public weak var delegate: WXScrollableActionSheetDelegate?
    
    public private(set) var titleLabel: UILabel!
    
    
    private var containerView: UIView!
    
    /// The background view. normally it is transparent.
    public private(set) var backgroundTappingView: UIView!
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func commonInit() {

        containerView = UIView()
        
        titleLabel = UILabel()
    }
}


extension WXScrollableActionSheet {
    
    class ScrollView: UIScrollView {
        
    }
    
}
