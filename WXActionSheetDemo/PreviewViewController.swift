//
//  PreviewViewController.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2019/1/9.
//  Copyright © 2019 shuifeng.me. All rights reserved.
//

import UIKit
import WXActionSheet

class PreviewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressedGesture(_:)))
        view.addGestureRecognizer(longPressGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleLongPressedGesture(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            showActionSheet()
        default:
            break
        }
    }
    
    private func showActionSheet() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.add(WXActionSheetItem(title: "发送给朋友", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "收藏", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "保存图片", handler: { _ in
            
        }))
        actionSheet.show()
    }
        
    override var prefersStatusBarHidden: Bool {
        return true
    }

}
