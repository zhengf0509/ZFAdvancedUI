//
//  ViewController.swift
//  ZFAdvancedUI
//
//  Created by 郑峰 on 2022/12/19.
//

import UIKit

var conIndex = 1

class ViewController: UIViewController, UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.white
        self.title = "第\(conIndex)视图控制器"
        conIndex += 1
        
        let btn = UIButton(type: .system)
        btn.frame = CGRect(x: 20, y: 100, width: 280, height: 30)
        btn.setTitle("push", for: .normal)
        btn.addTarget(self, action: #selector(push), for: .touchUpInside)
        self.view.addSubview(btn)
        
        // 导航栏
        self.navigationController?.navigationBar.tintColor = UIColor.purple
        let btnItem1 = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(click))
        let btnItem2 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(click))
        // 直接设置 self.navigationItem
        // 而不是 self.navigationController?.navigationItem
        self.navigationItem.rightBarButtonItems = [btnItem1, btnItem2]
        
        // 工具栏
        self.navigationController?.isToolbarHidden = false
        self.navigationController?.toolbar.tintColor = UIColor.red
        self.navigationController?.toolbar.barTintColor = UIColor.green
        let item1 = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(click))
        let item2 = UIBarButtonItem(title: "标题", style: .plain, target: self, action: #selector(click))
        self.toolbarItems = [item1, item2]
        
        self.navigationController?.hidesBarsWhenVerticallyCompact = true
//        self.navigationController?.hidesBarsOnTap = true
        
        let scrollView = UIScrollView(frame: CGRect(x: 50, y: 100, width: 200, height: 200))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 640, height: 415))
//        let imageView = UIImageView(frame: self.view.frame)
        imageView.image = UIImage(named: "ruhua")
        scrollView.addSubview(imageView)
        scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height * 2)
//        self.view.addSubview(scrollView)
        scrollView.scrollsToTop = true
        self.view.insertSubview(scrollView, belowSubview: btn)
//
//        let webView = UIWebView(frame: CGRect(x: 50, y: 350, width: 200, height: 200))
//        let url = URL(string: "https://www.baidu.com")
//        let request = URLRequest(url: url!)
//        webView.loadRequest(request)
//        self.view.addSubview(webView)
        
        
    }
    
    deinit {
        conIndex -= 1
    }

    // MARK: - action
    @objc func push() {
        let vc = ViewController();
        vc.title = "第\(conIndex)视图控制器"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func click(barItem:UIBarButtonItem) {
        print("navi item click")
    }
    
    // MARK: - UIResponser
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let tabBar = UITabBarController()
        var array = Array<UIViewController>()
        for index in 0..<10 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor(red: self.genRandomCGFloat(), green: self.genRandomCGFloat(), blue: self.genRandomCGFloat(), alpha: 1)
            vc.tabBarItem.title = "\(index)视图"
            array.append(vc)
        }
        tabBar.viewControllers = array
        self.present(tabBar, animated: true)
    }
    
    // MARK: - helper
    func genRandomCGFloat() -> CGFloat {
        return CGFloat(arc4random() % 255) / 255.0
    }
    
}

