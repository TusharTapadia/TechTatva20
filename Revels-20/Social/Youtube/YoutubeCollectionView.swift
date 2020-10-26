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
        var youData = [DataYT]()
        
    lazy var titleBackgroundText: UILabel = {
           let label = UILabel()
           label.text = "VIDEOS"
           label.font = UIFont.systemFont(ofSize: 90, weight: .bold)
           label.textColor = UIColor(white: 0.4, alpha: 0.3)
           label.textAlignment = .center
           return label
       }()
        
        lazy var titleLabel: UILabel = {
            let label = UILabel()
            label.text = "VIDEOS"
            label.font = UIFont.boldSystemFont(ofSize: 22)
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
            return youData.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! YoutubeCell
//            cell.layer.cornerRadius = 10
            let data = youData[indexPath.item]
            cell.backgroundColor = .black
            cell.thumbnailImageView.sd_setImage(with: URL(string: data.thumbnail), placeholderImage: UIImage(named: "logo.png"))
            cell.descriptionlabel.text = data.title
            cell.durationLabel.text = data.time
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4)
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//            print("frame height of youtube cell", frame.height)
     
            return CGSize(width: frame.width, height: 272)
          
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
    
//            }
//            Networking.sharedInstance.getYoutubeData { (data) in
//                print("YT data recieved----------------------------\n")
//                print(data)
//                print("\n\n")
//
            }
            
            getYouData()
            setupLayout()
        }
        
        fileprivate func setupLayout(){
            
            
            addSubview(titleBackgroundText)
            _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 2, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
            
            
            addSubview(titleLabel)
            _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 0)
            
           
            addSubview(youtubeCollectionView)
            youtubeCollectionView.anchorWithConstants(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 2, leftConstant: 10, bottomConstant: 0, rightConstant: 10)
           
            
            
        }
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    func getYouData(){
        print("Getting Youtube links")
        let urlString = "https://3a8f4c428a03.ngrok.io/youtube/TechTatva"
        let url = URL(string: urlString)
        guard url != nil else {
            print("wrong url")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
                
                let decoder = JSONDecoder()
                
                do{
                    let youtubefeed = try decoder.decode(Youtube.self, from: data!)
                    self.youData = youtubefeed.data
                    print(self.youData)
                } catch{
                    print(error)
                    print("error in json parsing")
                }
                DispatchQueue.main.async {
                    self.youtubeCollectionView.reloadData()
                }
                
            }
        }
        dataTask.resume()
    }
   
    }

    

