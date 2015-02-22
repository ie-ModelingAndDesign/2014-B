//
//  CustomCell.swift
//  swiftSample16
//
//  Copyright (c) 2014年 m_shige1979. All rights reserved.
//

import UIKit

class CustomViewCell: UITableViewCell {
    
    @IBOutlet var name: UILabel!
    @IBOutlet var twiButton: UIButton!
    @IBOutlet var progress: UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String!) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}