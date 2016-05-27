//
//  ViewController.swift
//  protocolTest
//
//  Created by kentaro on 2016/05/27.
//  Copyright © 2016年 kentaro aoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ModalViewDelegate {
    @IBOutlet weak var label: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func myButton(sender: UIButton) {
        showModal()
    }
    
    func showModal() {
        let modalView = ModalView(frame: self.view.bounds)
         modalView.customDelegate = self
        self.view.addSubview(modalView)
    }
    
    func modalView(text: String) {
        label.text = text
    }

}

