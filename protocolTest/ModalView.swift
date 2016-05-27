//
//  ModalView.swift
//  protocolTest
//
//  Created by kentaro on 2016/05/27.
//  Copyright © 2016年 kentaro aoki. All rights reserved.
//

import UIKit

@objc protocol ModalViewDelegate {
    //メソッドを定義
    func modalView(text: String)
}

class ModalView: UIView, UITextFieldDelegate {
    let textField = UITextField()
    weak var customDelegate: ModalViewDelegate?
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //Modalを表示した時に表示するグレーの背景の描画
        let backgroundView = UIView(frame: bounds)
        backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        //Modalの描画
        let modal = UIView(frame: CGRectMake((frame.width - 300) / 2, 100, 300, 200))
        modal.backgroundColor = UIColor.whiteColor()
        textField.frame.origin = CGPoint(x: 10, y: 10)
        textField.frame.size = CGSize(width: 280, height: 40)
        textField.backgroundColor = UIColor(red: 203/255, green: 73/255, blue: 62/255, alpha: 0.8)
        textField.delegate = self
        
        //modalの上に表示するボタンの描画
        let button = UIButton(frame: CGRectMake(0, modal.frame.height - 50, 80, 40))
        button.setTitle("Close", forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        
        //ボタンがタップされた時にcloseメソッドを呼ぶ
        button.addTarget(self, action: #selector(ModalView.close(_:)), forControlEvents:.TouchUpInside)
        
        //ViewControllerの上にグレーの背景を表示
        self.addSubview(backgroundView)
        
        //グレーの背景の上にModalを表示
        self.addSubview(modal)
        
        //Modalの上にtextFieldを表示
        modal.addSubview(textField)
        //Modalの上にボタンを表示
        modal.addSubview(button)
    }
    
    //closeボタンがタップされた時に呼ばれるメソッド
    func close(sender: UIButton) {
         customDelegate?.modalView(textField.text!)
        self.removeFromSuperview()
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //キーボードのreturnキーを押してキーボードを閉じる
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // キーボードを消す
        print("called delegate method")
        textField.resignFirstResponder()
        return true
    }
}