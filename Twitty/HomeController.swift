//
//  HomeController.swift
//  Twitty
//
//  Created by shaik mulla syed on 6/12/17.
//  Copyright © 2017 shaik mulla syed. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let cellid="CellId"
    let headerId="headerId"
    let footerId="footerId"
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: "CellId")
        collectionView?.register(UserHeader.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerId)
        collectionView?.register(UserFooter.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerId)
        
        let flowlayout=collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        //flowlayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        flowlayout.minimumLineSpacing = 0
        flowlayout.estimatedItemSize = CGSize(width: view.frame.width, height: 1000)
        flowlayout.itemSize = UICollectionViewFlowLayoutAutomaticSize
        
        setupData()
    }
    
    func setupData(){
        let sampleUsers=[User(Name: "shaik", UserName: "@shaik447", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "profilepic")),
                         User(Name: "Brain", UserName: "@BrianVoong", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "profile_image")),
                         User(Name: "Ray Wanderlich", UserName: "@ray", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "ray_profile_image")),
                         User(Name: "Ray Wanderlich", UserName: "@ray", BioText: "This is the programming language guide where you will learn swift, ios development and smooth animations. This is the programming language guide where you will learn swift, ios development and smooth animations.This is the programming language guide where you will learn swift, ios development and smooth animations. This is the programming language guide where you will learn swift, ios development and smooth animations", ProfileImage: #imageLiteral(resourceName: "ray_profile_image"))
        
        ]
        users.append(contentsOf: sampleUsers)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellId", for: indexPath) as? UserCell else{return UserCell()}
        cell.user=users[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
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
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
}
