//
//  HomeController.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/12/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit
import TRON

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    let cellid="CellId"
    let headerId="headerId"
    let footerId="footerId"
    
    //var users = [User]()
    var users:[User]?
    var tweets = [Tweet]()
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        collectionViewLayout.invalidateLayout()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        Service.sharedInstance.fetchHomefeed { (homefeed) in
            self.users = homefeed.users
            self.tweets = homefeed.tweets
            DispatchQueue.main.async {
                self.collectionView?.reloadData()
                
            }
        }

    }
    
    fileprivate func setupCollectionView(){
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: "TweetCell")
        collectionView?.register(UserHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(UserFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        collectionView?.backgroundColor = UIColor(red: 232/255, green: 236/255, blue: 242/255, alpha: 1)
        setupNavBars()
        let flowlayout=collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        //flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowlayout.minimumLineSpacing = 0
        
    }
    
    func setupData(){
//        users = [User]()
//        let sampleUsers=[User(Name: "Shaik", UserName: "@shaik447", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "profilepic")),
//                         User(Name: "Brain", UserName: "@BrianVoong", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "profile_image")),
//                         User(Name: "Ray Wanderlich", UserName: "@ray", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "ray_profile_image")),
//                        /* User(Name: "Ray Wanderlich", UserName: "@ray", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations. This is the programming language guide where you will learn swift, ios development and smooth animations.", ProfileImage: #imageLiteral(resourceName: "ray_profile_image")) */
//        
//        ]
//        //users?.append(contentsOf: sampleUsers)
//        
//        let sampletweets = [Tweet(user: sampleUsers[0], messageText: "This is the sample tweet for the twitter clone app. I couldnt find better tweet than this so i am using the same tweet because i couldnt find a good tweet. There are many sample tweets but i liked this tweet so i am using it and i need a long string to test the sample"),Tweet(user: sampleUsers[1], messageText: "This is the sample tweet for the twitter clone app. I couldnt find better tweet than this so i am using the same tweet because i couldnt find a good tweet. There are many sample tweets but i liked this tweet so i am using it and i need a long string to test the sample")]
//        
//        tweets.append(contentsOf: sampletweets)
        
        
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        print(users?.count ?? 456)
        return users?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as? UserCell else{return UserCell()}
            cell.user=users?[indexPath.row]
            return cell
        }
        
        if indexPath.section == 1{
            guard let seccell=collectionView.dequeueReusableCell(withReuseIdentifier: "TweetCell", for: indexPath) as? TweetCell else {return TweetCell()}
            seccell.tweet = tweets[indexPath.item]
            return seccell
        }
        
        return UICollectionViewCell()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == 1 {
            return CGSize(width: view.frame.width, height: 200)
        }
        
        let celluser=users?[indexPath.item]
        let estimatedwidthofbiotext = view.frame.width - 50 - 12 - 12
        let estimatedsize=CGSize(width: estimatedwidthofbiotext, height: 1000)
        let attributes=[NSFontAttributeName : UIFont.systemFont(ofSize: 15)]
        
        let estimatedFrame=NSString(string: celluser!.BioText).boundingRect(with: estimatedsize, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        return CGSize(width: view.frame.width, height: estimatedFrame.height + 70)
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader{
            let header=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
            
            return header
        }else{
            let footer=collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerId, for: indexPath)
            //footer.backgroundColor = .gray
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {return .zero}
        return users != nil ? CGSize(width: view.frame.width, height: 70) : .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {return .zero}
        if users != nil{
            return CGSize(width: view.frame.width, height: 70)
        }
        return .zero
        
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
}
