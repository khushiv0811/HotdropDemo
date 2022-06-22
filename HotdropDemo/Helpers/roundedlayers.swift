//
//  imagelayers.swift

//
//  Created by KHUSHBOO on 07/03/19.
//  Copyright © 2019 KHUSHBOO. All rights reserved.
//

import Foundation
import UIKit

//MARK: - UIVIEW

///Using this class for applying border color and widths  and rounded corners to existing UIelements

@IBDesignable
class roundedview: UIView
{
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0
    {
        didSet
        {
            layer.borderWidth = borderWidth
            
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0
    {
        didSet {
            layer.cornerRadius = cornerRadius
           
            layer.masksToBounds = true
        }
    }
    @IBInspectable var shadowOn: Bool = false {
        didSet {
            layer.shadowRadius          = cornerRadius/2
            layer.shadowOffset          = .zero
            layer.shadowOpacity         = 0.08
            layer.shadowColor           = UIColor(named: "Shadow")?.cgColor
            layer.shouldRasterize       = true
            layer.rasterizationScale    = UIScreen.main.scale
            layer.masksToBounds         = false
        }
    }
}
//MARK: - uilabel

@IBDesignable
class roundedlabel: UILabel
{
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet
        {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0
    {
        didSet {
            layer.cornerRadius = cornerRadius
           
            layer.masksToBounds = true
        }
    }
}
@IBDesignable
class shadowlabel: UILabel
{
    @IBInspectable var shadowBlur: CGFloat = 0 {
        didSet {
            layer.shadowRadius      = shadowBlur
        }
    }
}

// MARK: - Image View
@IBDesignable
class roundedimage: UIImageView
{
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
           
            layer.masksToBounds = true
        }
    }
}


//MARK: - Button
@IBDesignable
class roundedbutton: UIButton
{
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            
            layer.masksToBounds = true
        }
    }
    @IBInspectable var shadowOn: Bool = false {
        didSet {
            layer.shadowRadius          = cornerRadius/2
            layer.shadowOffset          = .zero
            layer.shadowOpacity         = 0.08
            layer.shadowColor           = UIColor(named: "Shadow")?.cgColor
            layer.shouldRasterize       = true
            layer.rasterizationScale    = UIScreen.main.scale
            layer.masksToBounds         = false
        }
    }

    @IBInspectable var iconContentMode: Bool = true {
        didSet {
            imageView?.contentMode = .scaleAspectFit
        }
    }
}




