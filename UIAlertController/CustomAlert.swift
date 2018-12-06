//
//  CustomAlert.swift
//  UIAlertController
//
//  Created by WY NG on 6/12/2018.
//  Copyright © 2018 lumanman. All rights reserved.
//

import UIKit

class CustomAlert: UIAlertController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var cancelBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUI() {
        titleLabel.text = "SWIFT~~~"
        imageView.image = UIImage(named: "image")
    }
    
    @IBAction func cancelClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
