//
//  ViewController.swift
//  scrollView
//
//  Created by student on 2018/12/17.
//  Copyright © 2018年 2016110401. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        scollView.delegate = self
        
        for i in 1...7 {
            let imageView = UIImageView(image: UIImage(named: "\(i)"))
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(x: CGFloat(i-1) * scollView.bounds.width, y: 0, width: scollView.bounds.width, height: scollView.bounds.height)
            scollView.addSubview(imageView)
        }
        
        scollView.contentSize = CGSize(width: scollView.bounds.width * 7, height: scollView.bounds.height)
        scollView.isPagingEnabled = true
        scollView.showsHorizontalScrollIndicator = false
        
        pageControl.numberOfPages = 7
        pageControl.currentPage = 0
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentPage = scrollView.contentOffset.x/scrollView.bounds.width
        pageControl.currentPage = Int(currentPage)
    }
    
    @IBAction func pageControlClicked(_ sender: Any) {
        let currentPage = sender.currentPage
        let rect = CGRect(x: CGFloat(currentPage) * scrollView.bounds.width, y: 0, width: scrollView.bounds.width, height: scrollView.bounds.height)
        scrollView.scrollRectToVisible(rect, animated: true)
    }
    

}

