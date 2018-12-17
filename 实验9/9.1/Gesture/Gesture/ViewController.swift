//
//  ViewController.swift
//  Gesture
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110401. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func addLable(_ sender: Any) {
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)
        
        let label = UILabel(frame: CGRect(x: x, y: y, width: 30, height: 30))
        label.text = "Am"
        label.textAlignment = .center
        label.backgroundColor = UIColor.blue
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 10, height: 10)
        label.layer.shadowOpacity = 1   //阴影
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        label.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        self.view.addSubview(label)
    }
    
    @IBAction func moveLable(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center = CGPoint(x: x, y: y)
                }
            }
        }
    }
    
    @IBAction func deleteLable(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                label.removeFromSuperview()
            }
        }
        
    }
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
            
        }
    }
}

