//
//  PresentViewController.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2018/12/29.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit
import WXActionSheet

class PresentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPressGesture(_:)))
        view.addGestureRecognizer(longPressGesture)
    }
    
    @objc private func handleLongPressGesture(_ gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began {
            let actionSheet = WXActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", buttonTitles: "发送给..", "收藏", "保存图片", "编辑")
            actionSheet.show()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PresentViewController: WXActionSheetDelegate {
    
    func actionSheet(_ actionSheet: WXActionSheet, clickedButtonAtIndex index: Int) {
        if actionSheet.name == "xxx" {
            
        }
    }
}
