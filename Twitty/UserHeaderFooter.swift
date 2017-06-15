//
//  UserHeaderFooter.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/15/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit


class UserHeader: UICollectionReusableView{
    
    var headerLabel:UILabel={
        let label=UILabel()
        label.text="WHO TO FOLLOW"
        label.font=UIFont.systemFont(ofSize: 16)
        return label
        
    }()
    
    var seperator:UIView={
        let uiview=UIView()
        uiview.backgroundColor = UIColor.lightGray
        return uiview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(headerLabel)
        addSubview(seperator)
        
        headerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        seperator.anchor(nil, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: 0, leftConstant: 12, bottomConstant: -3, rightConstant: -12, widthConstant: 0, heightConstant: 1.2)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class UserFooter: UICollectionReusableView{
    
    var footerLabel:UILabel={
        let label=UILabel()
        label.text="Show me more"
        label.font=UIFont.systemFont(ofSize: 14)
        label.textColor = twitterColor
        return label
        
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(footerLabel)
        footerLabel.anchor(self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, topConstant: -20, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
