//
//  ViewController.swift
//  YFMoreViewController
//
//  Created by 叶帆 on 2017/8/3.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), configuration: webConfiguration)
        webView.sizeToFit()
        webView.navigationDelegate = self
        view.addSubview(webView)
        
        let myURL = URL(string: "http://yeziahehe.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }

    @IBAction func showMore(_ sender: Any) {
        
        let moreViewController = YFMoreViewController.init()
        moreViewController.delegate = self
        
        moreViewController.addInfo("此网页由 yeziahehe.com 提供")
        moreViewController.addItems(title: "微信", image: #imageLiteral(resourceName: "wechat"), type: .important, tag: "wechat")
        moreViewController.addItems(title: "朋友圈", image: #imageLiteral(resourceName: "moments"), type: .important, tag: "moments")
        moreViewController.addItems(title: "微博", image: #imageLiteral(resourceName: "weibo"), type: .important, tag: "weibo")
        moreViewController.addItems(title: "QQ", image: #imageLiteral(resourceName: "QQ"), type: .important, tag: "QQ")
        moreViewController.addItems(title: "印象笔记", image: #imageLiteral(resourceName: "evernote"), type: .important, tag: "evernote")
        moreViewController.addItems(title: "Pocket", image: #imageLiteral(resourceName: "Pocket"), type: .important, tag: "Pocket")
        moreViewController.addItems(title: "有道云笔记", image: #imageLiteral(resourceName: "youdao"), type: .important, tag:"youdao")
        moreViewController.addItems(title: "Safari打开", image: #imageLiteral(resourceName: "safari"), type: .normal, tag:"safari")
        moreViewController.addItems(title: "复制链接", image: #imageLiteral(resourceName: "copy"), type: .normal, tag:"copylink")
        moreViewController.addItems(title: "刷新", image: #imageLiteral(resourceName: "refresh"), type: .normal, tag:"refresh")
        moreViewController.addItems(title: "搜索页面内容", image: #imageLiteral(resourceName: "search"), type: .normal, tag:"search")
        
        moreViewController.showFromBottom()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: YFMoreViewDelegate {
    
    func moreView(_ moreview: YFMoreViewController, didSelectItemAt tag: String, type: YFMoreItemType) {
        switch tag {
        case "wechat":
            return
        case "safari":
            UIApplication.shared.open(URL(string: "http://yeziahehe.com")!, options: [:], completionHandler: nil)
            print("safari")
            return
        case "copylink":
            return
        case "refresh":
            webView.load(URLRequest(url: URL(string: "http://yeziahehe.com")!))
            print("refresh")
            return
        default:
            return
        }
    }
}

