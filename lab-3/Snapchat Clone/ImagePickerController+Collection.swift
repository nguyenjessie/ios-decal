//
//  ImagePickerController+Collection.swift
//  Snapchat Clone
//
//  Created by Chris Zielinski on 2/28/18.
//  Copyright © 2018 org.iosdecal. All rights reserved.
//

import UIKit

extension ImagePickerController: UICollectionViewDataSource, UICollectionViewDelegate {

    /// DON'T MODIFY CODE HERE AND BELOW (we'll be going over this next lecture)!
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pickImageCell", for: indexPath) as! ImageCollectionViewCell
        cell.image.image = allImages[indexPath.row]
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! ImageCollectionViewCell
        selectImage(selectedCell.image.image!)
    }
    
}
