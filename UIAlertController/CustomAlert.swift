//
//  CustomAlert.swift
//  UIAlertController
//
//  Created by WY NG on 6/12/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

class CustomAlert: UIViewController{

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    private var cancleHandler: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Swift~~"
        imageView.image = UIImage(named: "image")
    }
    
    
    func setActionHandler(handler: @escaping () -> Void) {
        cancleHandler = handler
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        if self.cancleHandler == nil {
            return
        }
            self.cancleHandler!()
    }
    

}
