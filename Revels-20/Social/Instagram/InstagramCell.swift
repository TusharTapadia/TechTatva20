//
//  InstagramCell.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit

class InstagramCell: UICollectionViewCell {
    
    lazy var usernameLabel : UILabel = {
        let label = UILabel()
        label.text = "MITTECHTATVA"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    lazy var likeLabel : UILabel = {
        let label = UILabel()
        label.text = "12K"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21)
        return label
    }()
    
    lazy var commentsLabel : UILabel = {
        let label = UILabel()
        label.text = "1.2K"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 21)
        return label
    }()
   
    lazy var likeImageView : UIImageView = {
           let imageview = UIImageView()
           imageview.clipsToBounds = true
//           imageview.image = UIImage(named: "groupLock")
           imageview.contentMode = .scaleAspectFill
          imageview.backgroundColor = .gray
           return imageview
       }()
    
    lazy var profilePhotoImageview: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.setDimensions(width: 28, height: 28)
        iv.layer.cornerRadius = 28/2
        iv.backgroundColor = .gray
        return iv
    }()
    
    lazy var commentsImageView : UIImageView = {
           let imageview = UIImageView()
           imageview.clipsToBounds = true
//           imageview.image = UIImage(named: "groupLock")
           imageview.contentMode = .scaleAspectFill
          imageview.backgroundColor = .gray
           return imageview
       }()
    
   
    lazy var postImageView: UIImageView = {
        let iv = UIImageView()
            iv.contentMode = .scaleToFill
            iv.layer.cornerRadius = 25
            iv.layer.masksToBounds = true
//            iv.layer.borderColor = UIColor.white.cgColor
            iv.backgroundColor = .gray
//            iv.layer.borderWidth = 2
            iv.clipsToBounds = true
            return iv
        }()
    
    lazy var postCaption: UILabel = {
        let lb = UILabel()
        lb.text = "bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh bleh"
        lb.font = UIFont.systemFont(ofSize: 20)
        lb.textColor = .black
        lb.numberOfLines = 0
        lb.alpha = 1
        return lb
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        
        addSubview(profilePhotoImageview)
        
        _ = profilePhotoImageview.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 0)
        
        addSubview(usernameLabel)
        
        _ = usernameLabel.anchor(top: topAnchor, left: profilePhotoImageview.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 8, bottomConstant: 0, rightConstant: 8, heightConstant: 14)
       
        addSubview(postImageView)
        _ = postImageView.anchor(top: usernameLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 0, rightConstant: 8, heightConstant: 380)
        
        postImageView.addSubview(postCaption)
        
        _ = postCaption.anchor(top: postImageView.topAnchor, left: postImageView.leftAnchor, bottom: postImageView.bottomAnchor, right: postImageView.rightAnchor, topConstant: 290, leftConstant: 8, bottomConstant: 8, rightConstant: 8)
        
        addSubview(likeImageView)
    _ = likeImageView.anchor(top: postImageView.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, topConstant: 8, leftConstant: 8, bottomConstant: 4, rightConstant: 0, widthConstant: 24, heightConstant: 0)
        
        addSubview(likeLabel)
        _ = likeLabel.anchor(top: postImageView.bottomAnchor, left: likeImageView.rightAnchor, bottom: bottomAnchor, right: nil, topConstant: 6, leftConstant: 4, bottomConstant: 4, rightConstant: 0, heightConstant: 16)
        
        addSubview(commentsLabel)
        _ = commentsLabel.anchor(top: postImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 0, bottomConstant: 4, rightConstant: 6, widthConstant: 48, heightConstant: 16)
        
        
        addSubview(commentsImageView)
        _ = commentsImageView.anchor(top: postImageView.bottomAnchor, left: nil, bottom: bottomAnchor, right: commentsLabel.leftAnchor, topConstant: 8, leftConstant: 0, bottomConstant: 4, rightConstant: 6, widthConstant: 24, heightConstant: 0)
        
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

