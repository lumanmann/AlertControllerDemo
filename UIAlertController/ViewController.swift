//
//  ViewController.swift
//  UIAlertController
//
//  Created by WY NG on 6/12/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var descriptionText: [String]?
    private let titleStr = "Swift"
    private let messageStr = "作業不做了"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionText = ["沒有按鈕",
                           "一個按鈕，無點擊事件",
                           "一個按鈕，有點擊事件",
                           "兩個按鈕，有點擊事件",
                           "帶圖片",
                           "有文字輸入框",
                           "List",
                           "Custom",]
        
        
       self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func noButtonAlert() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        
        self.present(alert, animated: false, completion: {
            alert.view.superview?.isUserInteractionEnabled = true
            alert.view.superview?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.alertClose(gesture:))))})
    }
    
    @objc func alertClose(gesture: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func oneButtonAlert() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        
        // 加入按鈕
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func oneButtonAlertWithEvent() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        
        //  加入按鈕
        alert.addAction(UIAlertAction(title: "NO", style: .destructive, handler: { (_) -> Void in
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
        }))
        
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func twoButtonAlertWithEvent() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        
        //  加入第一顆按鈕
        alert.addAction(UIAlertAction(title: "Yes", style: .default){ (_) -> Void in
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        })
        
        // 加入第二顆按鈕
        alert.addAction(UIAlertAction(title: "No", style: .default) { (_) -> Void in
            
            let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
            
            self.navigationController?.pushViewController(vc, animated: true)
        })
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func withImageAlert() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alert.view, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: self.view.frame.height * 0.7)
        
        alert.view.addConstraint(height);
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width * 0.7, height: self.view.frame.height * 0.5))
        
        imageView.image = UIImage(named: "image")
        
        // 加入圖片
        alert.view.addSubview(imageView)
        // 加入按鈕
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func withTextFieldAlert() {
        let alert = UIAlertController(title: self.titleStr, message: self.messageStr, preferredStyle: .alert)
        // 加入文字輸入框
        alert.addTextField(configurationHandler: {
            (textField:UITextField!) -> Void in
            textField.placeholder = "Enter your gitHub link:"
            
        })
       
        // 加入按鈕
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func listChoiceAlert() {
        
        let alert = UIAlertController(title: "List", message: "choose one: ", preferredStyle: .actionSheet);
        
        let action1 = UIAlertAction(title: "Action 1", style: .default, handler: { (_) -> Void in
            print("ACTION 1 selected!")
        })
        
        let action2 = UIAlertAction(title: "Action 2", style: .default, handler: { (_) -> Void in
            print("ACTION 2 selected!")
        })
        
        let action3 = UIAlertAction(title: "Action 3", style: .default, handler: { (_) -> Void in
            print("ACTION 3 selected!")
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        
        action1.isEnabled = false
        action2.isEnabled = false
        action3.isEnabled = false
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        alert.addAction(cancel)
        
        self.present(alert, animated: false, completion: nil)
        
    }
    
    
   
    func customAlert() {
        let alertVC = CustomAlert(nibName: "CustomAlert", bundle: nil)
       
    }

}

extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.descriptionText?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "reusableCell")
        if cell == nil {
            cell = UITableViewCell(style:.default, reuseIdentifier: "reusableCell")
        }
        cell?.textLabel?.text = self.descriptionText?[indexPath.row]
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 15)
        cell?.textLabel?.textColor = UIColor.black
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // 沒有按鈕
            noButtonAlert()
        case 1:
            // 一個按鈕，無點擊事件
            oneButtonAlert()
        case 2:
            // 一個按鈕，有點擊事件
            oneButtonAlertWithEvent()
        case 3:
            // 兩個按鈕，有點擊事件
            twoButtonAlertWithEvent()
        case 4:
            // 帶圖片
            withImageAlert()
        case 5:
            // 有文字輸入框
            withTextFieldAlert()
        case 6:
            //
            listChoiceAlert()
        case 7:
            customAlert()
        default:
            noButtonAlert()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}

