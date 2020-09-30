//
//  YoutubeCollectionView.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit

class YoutubeCollectionView: UICollectionViewCell,UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
        
        private let cellId = "cellID"
    
    lazy var titleBackgroundText: UILabel = {
           let label = UILabel()
           label.text = "VIDEOS"
           label.font = UIFont.systemFont(ofSize: 110, weight: .bold)
           label.textColor = UIColor(white: 0.4, alpha: 0.3)
           label.textAlignment = .center
           return label
       }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "VIDEOS"
//            label.font = UIFont(name: "Avenir", size: 20)
            label.font = UIFont.boldSystemFont(ofSize: 28)
            label.textColor = UIColor(white: 1, alpha: 0.7)
            label.textAlignment = .center
            label.textColor = .white
            return label
        }()
        
        lazy var youtubeCollectionView: UICollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .vertical
            let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
            cv.delegate = self
            cv.dataSource = self
            cv.isUserInteractionEnabled = true 
            cv.register(YoutubeCell.self, forCellWithReuseIdentifier: cellId)
            return cv
        }()
        
        lazy var seperatorLineView: UIView = {
            let view = UIView()
            view.backgroundColor = .black
            return view
        }()
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    //      return youtubeCache.count
            return 5
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! YoutubeCell
//            cell.layer.cornerRadius = 10
            cell.backgroundColor = .black
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            print("frame height of youtube cell", frame.height)
            return CGSize(width: frame.width-8, height: frame.height/3)
          
        }
        
    //    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //        if youtubeItems?.count == 0{
    //            return
    //        }
    //        let youtubeId = youtubeItems![indexPath.item].id
    //        if let videoId = youtubeId.videoId{
    //            self.socialViewController?.openYoutubeVideo(id: videoId)
    //        }
    //        if let playlistId = youtubeId.playlistId{
    //            self.socialViewController?.openYoutubePlaylist(id: playlistId)
    //        }
    //    }
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            if #available(iOS 13.0, *) {
                youtubeCollectionView.backgroundColor = .black
    
            }
           // getYoutubeJSON()
           
            setupLayout()
        }
        
        fileprivate func setupLayout(){
            
            
            addSubview(titleBackgroundText)
            _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 4, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
            
            
            addSubview(titleLabel)
            _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 128)
            
           
            addSubview(youtubeCollectionView)
            youtubeCollectionView.anchorWithConstants(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 8, leftConstant: 16, bottomConstant: 0, rightConstant: 16)
           
            
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

    

