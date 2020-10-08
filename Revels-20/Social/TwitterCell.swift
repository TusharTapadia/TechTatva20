//
//  TwitterCell.swift
//  
//
//  Created by Rohit Kuber on 27/09/20.
//

import UIKit

class TwitterCell: UICollectionViewCell{
    
    lazy var tweetView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 10
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.setDimensions(width: 28, height: 28)
        iv.layer.cornerRadius = 28/2
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.backgroundColor = .white
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "MITTechtatva"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var tweetlabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
   
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var retweetLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    
    lazy var commentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    lazy var likesImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 4
//        iv.setDimensions(width: 8, height: 8)
        iv.backgroundColor = .gray
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        return iv
    }()
    
    lazy var retweetImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 4
//        iv.setDimensions(width: 16, height: 16)
        iv.backgroundColor = .gray
        iv.layer.masksToBounds = true
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    lazy var commentImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.layer.cornerRadius = 4
        iv.layer.masksToBounds = true
//        iv.setDimensions(width: 16, height: 16)
        iv.backgroundColor = .gray
        iv.clipsToBounds = true
        iv.layer.borderWidth = 0.5
        return iv
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    fileprivate func setupLayout(){
        addSubview(tweetView)
        
        _ = tweetView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 0, widthConstant: frame.width-120 , heightConstant: 144)
        
        tweetView.addSubview(profileImageView)
        tweetView.addSubview(usernameLabel)
        
        _ = profileImageView.anchor(top: tweetView.topAnchor, left: tweetView.leftAnchor, bottom: nil, right: nil, topConstant: 6, leftConstant: 8, bottomConstant: 0, rightConstant: 0)
        
        
        _ = usernameLabel.anchor(top: tweetView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: rightAnchor, topConstant: 10, leftConstant: 8, bottomConstant: 0, rightConstant: 8, heightConstant: 14)
        
        addSubview(tweetlabel)
        
        _ = tweetlabel.anchor(top: profileImageView.bottomAnchor, left: tweetView.leftAnchor, bottom: tweetView.bottomAnchor, right: tweetView.rightAnchor, topConstant: 2, leftConstant: 18, bottomConstant: 4, rightConstant: 8)
        
        let stackView = UIStackView(arrangedSubviews: [likesLabel,retweetLabel,commentsLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
//        stackView.backgroundColor = .bl
        addSubview(stackView)
        _ = stackView.anchor(top: topAnchor, left: nil, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 16, rightConstant: 8, widthConstant: 64, heightConstant: 0)
        
        
        let logoStackView = UIStackView(arrangedSubviews: [likesImageView,retweetImageView,commentImageView])
        logoStackView.axis = .vertical
        logoStackView.distribution = .fillEqually
        logoStackView.backgroundColor = .blue
        
        addSubview(logoStackView)
       _ = logoStackView.anchor(top: topAnchor, left: tweetView.rightAnchor, bottom: bottomAnchor, right: stackView.leftAnchor, topConstant: 16, leftConstant: 8, bottomConstant: 16, rightConstant: 2, widthConstant: 0, heightConstant: 0)
    
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

    

