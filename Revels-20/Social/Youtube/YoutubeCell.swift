//
//  YoutubeCell.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit

class YoutubeCell: UICollectionViewCell {
    
    lazy var thumbnailImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.layer.cornerRadius = 22
        iv.backgroundColor = .gray
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var durationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = .yellow
        label.text = "2:48"
        label.textColor = .black
        label.clipsToBounds = true
        
        return label
    }()
    
    lazy var viewslabel: UILabel = {
        let label  = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.layer.borderWidth = 1
        label.layer.cornerRadius = 5
        label.layer.borderColor = UIColor.black.cgColor
        label.backgroundColor = .yellow
        label.text = "248"
        label.textColor = .black
        label.clipsToBounds = true
        
        return label
    }()
    
    lazy var descriptionlabel: UILabel = {
        let label  = UILabel()
        if UIViewController().isSmalliPhone(){
            label.font = UIFont.systemFont(ofSize: 16)
        }else{
            label.font = UIFont.systemFont(ofSize: 20)
        }
        label.numberOfLines = 1
        label.textColor = .white
        label.text = "Techtatva 20 is back, yeah yeah"
        label.textAlignment = .center
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
     let containerview = UIView()
    
    fileprivate func setupLayout(){
 
        addSubview(thumbnailImageView)
        
        _ = thumbnailImageView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 8, bottomConstant: 0, rightConstant: 8, widthConstant: 0, heightConstant: 224)

        
        thumbnailImageView.addSubview(durationLabel)
        
        thumbnailImageView.addSubview(viewslabel)
        
        
        addSubview(descriptionlabel)
        
       
        _ = durationLabel.anchor(top: thumbnailImageView.topAnchor, left: nil, bottom: nil, right: thumbnailImageView.rightAnchor, topConstant: 12, leftConstant: 0, bottomConstant: 0, rightConstant: 16, widthConstant: 42, heightConstant: 24)
        
        _ = viewslabel.anchor(top: nil, left: nil, bottom: thumbnailImageView.bottomAnchor, right: thumbnailImageView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 12, rightConstant: 16,widthConstant: 42, heightConstant: 24)
        
        
        _ = descriptionlabel.anchor(top: thumbnailImageView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 8 ,heightConstant: 26)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

