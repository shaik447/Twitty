//
//  WorldCell.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/12/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class WordCell: UICollectionViewCell {
    
    var wordLabel:UILabel={
        let uilabel=UILabel()
        uilabel.text="some text"
        //uilabel.backgroundColor = .red
        uilabel.translatesAutoresizingMaskIntoConstraints=false
        return uilabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .yellow
        SetupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func SetupViews() {
        addSubview(wordLabel)
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive=true
        wordLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive=true
        wordLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: 0).isActive=true
        wordLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive=true
    }
}
