//
//  MyView.swift
//  HelloWorld
//
//  Created by apple on 2018/12/17.
//  Copyright © 2018年 2016110401. All rights reserved.
//

import UIKit

class MyView: UIView {
    
    private var function: ((CGFloat) -> CGFloat)? //一元函数
    
    override func draw(_ rect: CGRect) {
      
        super.draw(rect)
        
        
        let rectPath = UIBezierPath(rect: rect)
        //设置白色填充
        UIColor.white.setFill()
        //先将MyView填充一层白色
        rectPath.fill()
        
        //再创建一个UIBezierPath变量，用于绘制坐标系
        let path = UIBezierPath()
        //坐标系用红色描边
        UIColor.black.setStroke()
        //坐标系以MyView中心为原点，向右为x正方向，向上为y正方向
        //先将path移动到左边线中点处
        path.move(to: CGPoint(x: 0, y: rect.height / 2))
        //然后添加一条到右边线中点处的直线
        path.addLine(to: CGPoint(x: rect.width, y: rect.height / 2))
        //绘制这条直线
        path.stroke()
      
        
        //绘制y轴原理同上
        path.move(to: CGPoint(x: rect.width / 2, y: 0))
        path.addLine(to: CGPoint(x: rect.width / 2, y: rect.height))
        path.stroke()
        
        //判断函数是否为空
        if function != nil {
            let path = curve(rect: rect, color: UIColor.red, function: function!)
            path.stroke()
        }
    }
    
    
    
    func drawCurve(function: @escaping (CGFloat) -> CGFloat) {
        self.function = function
        self.draw(self.frame)
    }
    
    
    
    private func curve(rect: CGRect, color: UIColor, function: (CGFloat) -> CGFloat) -> UIBezierPath {
        let path = UIBezierPath()
        
        //该绘制区域的宽度的一半
        let center = rect.width / 2
        //y轴的高度的一半
        let height = rect.height / 2
        //需要计算多少个x值对应的y值（x轴正半轴）
        let rate: CGFloat = 100
        color.setStroke()
        
        //从原点开始，先计算x轴正半轴的所有y值
        path.move(to: CGPoint(x: center, y: height - function(0) / rate))
        //stride为步进函数，设置起始值、结尾值和步进值
        for item in stride(from: center / rate, through: center, by: center / rate) {
            path.addLine(to: CGPoint(x: center + item, y: height - function(item) / rate))
        }
        
        
        //绘制x轴负半轴的所有y值
        path.move(to: CGPoint(x: center, y: height - function(0) / rate))
        for item in stride(from: center / rate, through: center, by: center / rate) {
            path.addLine(to: CGPoint(x: center - item, y: height - function(-item) / rate))
        }
        
        return path
    }
    
}

