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
        title = "WXActionSheet"
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            showNormal()
        case 1:
            showDarkStyle()
        case 2:
            showWithoutCancelButton()
        case 3:
            showButtonsWithImage()
        case 4:
            print("...")
        case 5:
            showCustomTitleView()
        case 6:
            showInActionSheet()
        case 7:
            customActionSheet()
        case 8:
            showActionSheetWithItemDesc()
        case 9:
            showScrollActionSheet()
        default:
            break
        }
    }
    
    private func showNormal() {
        
        //WXActionSheetStyle.lightAppearance.destructiveButtonTitleColor = .blue
        
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.add(WXActionSheetItem(title: "发送给朋友", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "收藏", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "保存图片", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "删除", handler: { _ in
            
        }, type: .destructive))
        actionSheet.show()
    }
    
    private func showDarkStyle() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.style = .dark
        actionSheet.add(WXActionSheetItem(title: "发送给朋友", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "收藏", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "保存图片", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "删除", handler: { _ in
            
        }, type: .destructive))
        actionSheet.show()
    }
    
    private func showWithoutCancelButton() {
        let actionSheet = WXActionSheet(cancelButtonTitle: nil)
        actionSheet.add(WXActionSheetItem(title: "只看女生", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "只看男生", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "查看全部", handler: { _ in
            
        }))
        actionSheet.show()
    }
    
    private func showButtonsWithImage() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        let videoItem = WXActionSheetItem(title: "视频聊天") { _ in
            
        }
        videoItem.iconImage = UIImage(named: "video_chat_24x24_")
        videoItem.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        actionSheet.add(videoItem)
        
        let audioItem = WXActionSheetItem(title: "语音聊天") { _ in
            
        }
        audioItem.iconImage = UIImage(named: "audio_chat_24x24_")
        audioItem.titleEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        actionSheet.add(audioItem)
        
        actionSheet.show()
    }
    
    private func showCustomTitleView() {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 50))
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        titleLabel.textColor = UIColor.gray
        titleLabel.text = "清除位置信息后，别人将不能查看到你"
        titleView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.titleView = titleView
        actionSheet.add(WXActionSheetItem(title: "清除位置并退出", handler: { _ in
            
        }, type: .destructive))
        actionSheet.show()

    }
    
    private func showInActionSheet() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.add(WXActionSheetItem(title: "只看女生", handler: { _ in
            self.showCustomTitleView()
        }))
        actionSheet.add(WXActionSheetItem(title: "只看男生", handler: { _ in
            self.showCustomTitleView()
        }))
        actionSheet.add(WXActionSheetItem(title: "查看全部", handler: { _ in
            self.showCustomTitleView()
        }))
        actionSheet.add(WXActionSheetItem(title: "附近打招呼的人", handler: { _ in
            self.showCustomTitleView()
        }))
        actionSheet.add(WXActionSheetItem(title: "清除位置并退出", handler: { _ in
            self.showCustomTitleView()
        }))
        actionSheet.show()
    }
    
    private func customActionSheet() {
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 300))
        contentView.backgroundColor = .blue
        contentView.layer.cornerRadius = 16
        contentView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        contentView.clipsToBounds = true
        WXActionSheet.show(contentView)
    }
    
    private func showActionSheetWithItemDesc() {
        let actionSheet = WXActionSheet(cancelButtonTitle: "取消")
        actionSheet.add(WXActionSheetItem(title: "拍摄", desc: "照片或视频", handler: { _ in
            
        }))
        actionSheet.add(WXActionSheetItem(title: "从手机相册选择", handler: { _ in
            
        }))
        actionSheet.show()
    }
    
    private func showScrollActionSheet() {
        let actionSheet = WXScrollActionSheet()
        actionSheet.topItems = [
            WXScrollActionSheetItem(item: .sendToFriend, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .sendToTimeline, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .favorite, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .openInSafari, icon: UIImage(named: "")),
        ]
        actionSheet.bottomItems = [
            WXScrollActionSheetItem(item: .report, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .copyLink, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .refresh, icon: UIImage(named: "")),
            WXScrollActionSheetItem(item: .searchInPage, icon: UIImage(named: "")),
        ]
        actionSheet.delegate = self
        actionSheet.show()
    }
}

extension ViewController: WXScrollActionSheetDelegate {
    
    func scrollActionSheet(_ scrollActionSheet: WXScrollActionSheet, didSelectItem item: WXScrollActionSheetItem) {
        
    }
    
}

extension WXScrollActionSheetItem {
    
    convenience init(item: ScrollActionItem, icon: UIImage?) {
        self.init(identifier: item.rawValue, title: item.title, iconImage: icon)
    }
}

enum ScrollActionItem: String {
    case sendToFriend
    case sendToTimeline
    case favorite
    case openInSafari
    case report
    case copyLink
    case refresh
    case searchInPage
    
    var title: String {
        switch self {
        case .sendToFriend: return "发送给好友"
        case .sendToTimeline: return "发送到朋友圈"
        case .favorite: return "收藏"
        case .openInSafari: return "在Safari中打开"
        case .report: return "举报"
        case .copyLink: return "复制链接"
        case .refresh: return "刷新"
        case .searchInPage: return "搜索页面内容"
        }
    }
}
