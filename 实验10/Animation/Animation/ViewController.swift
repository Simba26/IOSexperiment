//
//  ViewController.swift
//  Animation
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110401. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstView: UIView!
    var secondView: UIView!
    
    var animator: UIDynamicAnimator!
    
    var gravity = UIGravityBehavior()
    var collision = UICollisionBehavior()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        animation()
        
        transition()
        
        dynamicAnimation()
    }
    
    //视图位置、大小转换
    func animation() {
        let view = UIView(frame: CGRect(x: 300, y: 100, width: 100, height: 100))
        view.backgroundColor = UIColor.yellow
        self.view.addSubview(view)
        UIView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {
            view.frame = CGRect(x: 0, y: 20, width: 10, height: 10)
            view.backgroundColor = UIColor.orange
            view.transform = view.transform.rotated(by: CGFloat.pi)
        }, completion: nil)
    }
    
    func transition() {
        
        let btn = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 44))
        btn.setTitle("切换视图", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.addTarget(self, action: #selector(changeView), for: .touchUpInside)
        self.view.addSubview(btn)
        
        firstView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        firstView.backgroundColor = UIColor.green
        self.view.addSubview(firstView)
        
        secondView = UIView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        secondView.backgroundColor = UIColor.brown
        self.view.addSubview(secondView)
        
    }
    //动画执行
    @objc func changeView() {
        UIView.transition(from: secondView, to: firstView, duration: 3, options: [.transitionCurlUp], completion: nil)
    }
    
    func dynamicAnimation() {
        animator = UIDynamicAnimator(referenceView: self.view)
        
        animator.addBehavior(gravity)
        animator.addBehavior(collision)
        
        collision.translatesReferenceBoundsIntoBoundary = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (t) in
            let x = CGFloat(arc4random() % (UInt32(self.view.frame.width) - 50))
            let view = UIView(frame: CGRect(x: x, y: 20, width: 50, height: 50))
            view.backgroundColor = UIColor.red
            view.layer.borderWidth = 1
            view.layer.cornerRadius = 10
            self.view.addSubview(view)
            
            self.gravity.addItem(view)
            self.collision.addItem(view)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

