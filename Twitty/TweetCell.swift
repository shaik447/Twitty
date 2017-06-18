//
//  TweetCell.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/16/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class TweetCell : UICollectionViewCell{
    
    var txtView:UILabel={
        var label=UILabel()
        label.text="SOME SAMPLE TEXT"
        label.backgroundColor = .blue
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(txtView)
        backgroundColor = .white
        txtView.anchor(self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 2, leftConstant: 10, bottomConstant: 0, rightConstant: -10, widthConstant: 0, heightConstant: 20)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
}
