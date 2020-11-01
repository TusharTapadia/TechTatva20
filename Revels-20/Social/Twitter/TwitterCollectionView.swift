//
//  TwitterCollectionView.swift
//  Revels-20
//
//  Created by Rohit Kuber on 27/09/20.
//  Copyright © 2020 Naman Jain. All rights reserved.
//

import UIKit
import SDWebImage
import Disk

class TwitterCollectionView: UICollectionViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    
    
    private let cellId = "cellID"

    var tweetData = [tweets]()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Feed"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = UIColor(white: 1, alpha: 0.7)
        label.textColor = .white
        return label
    }()
  
    lazy var titleBackgroundText: UILabel = {
        let label = UILabel()
        label.text = "FEED"
        label.font = UIFont.systemFont(ofSize: 90, weight: .bold)
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
    
//    lazy var tweetsTableView: UITableView = {
//        let tv = UITableView()
//        tv.delegate = self
//        tv.dataSource = self
//        tv.isUserInteractionEnabled = true
//        tv.register(TweetTableViewCell.self, forCellReuseIdentifier: cellId)
//        tv.separatorStyle = .none
//        return tv
//    }()

//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tweetData.count
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tweetData.count
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TweetTableViewCell
//        let data = tweetData[indexPath.row]
//        print(data)
//        cell.usernameLabel.text = data.name
//        cell.profileImageView.sd_setImage(with: URL(string: data.profileImage), placeholderImage: UIImage(named: "logo.png"))
//        cell.tweetlabel.text=data.tweet
//        cell.likesLabel.text = data.like
//        cell.retweetLabel.text = data.reTweet
//        return cell
////    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! TwitterCell
        let data = tweetData[indexPath.row]
        print(data)
        cell.usernameLabel.text = data.name
        cell.profileImageView.sd_setImage(with: URL(string: data.profileImage), placeholderImage: UIImage(named: "logo.png"))
        cell.tweetlabel.text=data.tweet
        cell.likesLabel.text = data.like
        cell.retweetLabel.text = data.reTweet
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
        let url = tweetData[indexPath.item].link
        let webURL = NSURL(string: url)!
        let application = UIApplication.shared
        application.open(webURL as URL)
    }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            setupLayout()
            getTwitterData()
            self.tweetData = self.getTwitterItemsFromCache() ?? []
            
            tweetsCollectionView.refreshControl = UIRefreshControl()
            tweetsCollectionView.refreshControl?.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)

        }
        
        @objc private func pullToRefresh(){
            self.tweetData = []
            getTwitterData()
            self.tweetData = self.getTwitterItemsFromCache() ?? []
            
            DispatchQueue.main.async {
                self.tweetsCollectionView.refreshControl?.endRefreshing()
                self.tweetsCollectionView.reloadData()
            }
        }

  func setupLayout(){
    addSubview(titleBackgroundText)
    _ = titleBackgroundText.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 2, leftConstant: -32, bottomConstant: 0, rightConstant: -32, widthConstant: 0, heightConstant: 0)
    
    
    addSubview(titleLabel)
    _ = titleLabel.anchor(top: titleBackgroundText.topAnchor, left: leftAnchor, bottom: titleBackgroundText.bottomAnchor, right: rightAnchor, topConstant: 6, leftConstant: 16, bottomConstant: 0, rightConstant: 16, heightConstant: 0)
    
        addSubview(tweetsCollectionView)
    _ = tweetsCollectionView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 2, leftConstant: 16, bottomConstant: 0, rightConstant: 8)
     
    }
    
    func getTwitterData(){
        print("Getting Twitter links")
        let urlString = "https://techtatvadata.herokuapp.com/tweets"
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
                    let twitterfeed = try decoder.decode(twitter.self, from: data!)
//                    self.tweetData=twitterfeed.data
                    self.saveTwitterToCache(data: twitterfeed.data)
                    print(twitterfeed)
                } catch{
                    print(error)
                    print("error in json parsing")
                }
                DispatchQueue.main.async {
                    self.tweetsCollectionView.reloadData()
                }
                
            }
        }
        dataTask.resume()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getTwitterItemsFromCache() -> [tweets]? {
        do{
            let retrievedData = try Disk.retrieve("twitter.json", from: .caches, as: [tweets].self)
            print("saved to cache twitter")
            return retrievedData
        }catch{
            return nil
        }
    }
    
    func saveTwitterToCache(data: [tweets]){
        do{
            try Disk.save(data, to: .caches, as: "twitter.json")
            print("retrieved from cache twitter")
        }catch let error{
            print(error)
        }
    }

}
