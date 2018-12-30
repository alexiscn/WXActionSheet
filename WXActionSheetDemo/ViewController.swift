//
//  ViewController.swift
//  WXActionSheetDemo
//
//  Created by xu.shuifeng on 2018/12/26.
//  Copyright © 2018 shuifeng.me. All rights reserved.
//

import UIKit
import WXActionSheet

class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
           
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.section == 0 && indexPath.row == 1 {
            normal()
        }
    }
    
    private func normal() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.append(WXActionSheetItem(title: "删除", handler: { _ in
            
        }, type: .destructive))
//        actionSheet.append(WXActionSheetItem(title: "取消", handler: { _ in
//            
//        }, type: .cancel))
        actionSheet.show()
    }

}


