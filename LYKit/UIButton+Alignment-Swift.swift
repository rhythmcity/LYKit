//
//  UIButton+Alignment-Swift.swift
//  LYKit
//
//  Created by 李言 on 16/6/26.
//  Copyright © 2016年 李言. All rights reserved.
//

import UIKit

extension UIButton {

    func titleImageVerticalAlignmentWithSpace(space:Float) -> Void {
        self.ly_resetEdgeInsets()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let contentRect = self.contentRectForBounds(self.bounds)
        let titleSize = self.titleRectForContentRect(contentRect).size
        let imageSize = self.imageRectForContentRect(contentRect).size
        let  halfWidth    = (titleSize.width + imageSize.width) / 2
        let  halfHeight   = (titleSize.height + imageSize.height) / 2
        let  topInset     =  halfHeight < titleSize.height ? halfHeight : titleSize.height
        let  leftInset    = (titleSize.width - imageSize.width) > 0 ? (titleSize.width - imageSize.width) / 2 : 0
        let bottomInset   = (titleSize.height - imageSize.height) > 0 ? (titleSize.height - imageSize.height) / 2 : 0
        let rightInset    = halfWidth < titleSize.width ? halfWidth : titleSize.width
        
        
        self.titleEdgeInsets = UIEdgeInsetsMake(-halfHeight - CGFloat(space), -halfWidth, halfHeight + CGFloat(space), halfWidth)
      
        self.contentEdgeInsets = UIEdgeInsetsMake(topInset + CGFloat(space), leftInset, -bottomInset, rightInset)

        
    }

    
    func imageTitleVerticalAlignmentWithSpace(space:Float) -> Void {
        self.ly_resetEdgeInsets()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let contentRect = self.contentRectForBounds(self.bounds)
        let titleSize = self.titleRectForContentRect(contentRect).size
        let imageSize = self.imageRectForContentRect(contentRect).size

        let  halfWidth    = (titleSize.width + imageSize.width) / 2
        let  halfHeight   = (titleSize.height + imageSize.height) / 2
        let  topInset     =  halfHeight < titleSize.height ? halfHeight : titleSize.height
        let  leftInset    = (titleSize.width - imageSize.width) > 0 ? (titleSize.width - imageSize.width) / 2 : 0
        let bottomInset   = (titleSize.height - imageSize.height) > 0 ? (titleSize.height - imageSize.height) / 2 : 0
        let rightInset    = halfWidth < titleSize.width ? halfWidth : titleSize.width
        
        
        self.titleEdgeInsets = UIEdgeInsetsMake(halfHeight + CGFloat(space), -halfWidth, -halfHeight - CGFloat(space), halfWidth)
        self.contentEdgeInsets = UIEdgeInsetsMake(-bottomInset, leftInset, topInset + CGFloat(space), rightInset)
    

        
    }
    
    func titleImageHorizontalAlignmentWithSpace(space:Float) -> Void {
        self.ly_resetEdgeInsets()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        let contentRect = self.contentRectForBounds(self.bounds)
        let titleSize = self.titleRectForContentRect(contentRect).size
        let imageSize = self.imageRectForContentRect(contentRect).size
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, CGFloat(space))
        self.titleEdgeInsets = UIEdgeInsetsMake(0, -imageSize.width, 0, imageSize.width)
        self.imageEdgeInsets = UIEdgeInsetsMake(0, titleSize.width + CGFloat(space), 0, -titleSize.width - CGFloat(space))

        
    }
    
    func imageTitleHorizontalAlignmentWithSpace(space:Float) -> Void {
        self.ly_resetEdgeInsets()
        self.setNeedsLayout()
        self.layoutIfNeeded()
        self.titleEdgeInsets = UIEdgeInsetsMake(0, CGFloat(space), 0, CGFloat(-space))
        self.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, CGFloat(space))
        
    }

    
    private func ly_resetEdgeInsets() -> Void {
    
        self.contentEdgeInsets  = UIEdgeInsetsZero
        self.titleEdgeInsets    = UIEdgeInsetsZero
        self.imageEdgeInsets    = UIEdgeInsetsZero
    
    }

}


