//
//  TwitterCollectionView.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit

class TwitterCollectionView: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    private let cellId = "cellID"

    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Feed"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.textColor = .white
        return label
    }()
  
    lazy var titleBackgroundText: UILabel = {
        let label = UILabel()
        label.text = "FEED"
        label.font = UIFont.systemFont(ofSize: 110, weight: .bold)
        label.textColor = UIColor(white: 0.4, alpha: 0.3)
        label.textAlignment = .center
        return label
       }()
    
    lazy var tweetsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .black
        cv.isUserInteractionEnabled = true
        cv.register(TwitterCell.self, forCellWithReuseIdentifier: cellId)
        return cv
    }()
    
   
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TwitterCell
//        cell.likesImageView.image = UIImage(named: "Insta")
         
         cell.tweetlabel.text = "Early civilizations thought Venus was two different bodies. These were called Phosphorus and Hesperus by the Greeks, and Lucifer and Vesper by the Romans. This is because it was visible both before and after sunrise."
//         cell.tweetlabel.numberOfLines = 4
//         cell.tweetlabel.font = UIFont.boldSystemFont(ofSize: 20)
//        
//         cell.usernameLabel.text = "MITTECHTATTVA"
//         cell.usernameLabel.font = UIFont.boldSystemFont(ofSize: 17)
//         
         cell.likesLabel.text = "12k"
         cell.likesLabel.font = UIFont.boldSystemFont(ofSize: 20)
         
         cell.retweetLabel.text = "1.2k"
         cell.retweetLabel.font = UIFont.boldSystemFont(ofSize: 20)
         
         cell.commentsLabel.text = "6.5K"
         cell.commentsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 4, left: 8, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
         return 4
        //    return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: 172 )
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Clicked me ")
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }

  func setupLayout(){
//        addSubview(titleLabel)
//
//    _ = titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 32, bottomConstant: 0, rightConstant: 32,widthConstant: 128, heightConstant: 128)
    
    addSubview(titleBackgroundText)
    _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
    
    
    addSubview(titleLabel)
    _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 128)
    
        addSubview(tweetsCollectionView)
    _ = tweetsCollectionView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 8)
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
