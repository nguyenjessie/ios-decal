//
//  ImagePreviewViewController.swift
//  Snapchat Clone
//
//  Created by Paige Plander on 9/27/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

/// View Controller to preview selected images. You'll need
/// to make changes to this file
class ImagePreviewViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var imageToDisplay = allImages[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = imageToDisplay
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(_ sender: Any) {
        performSegue(withIdentifier: "unwindToImagePreview", sender: self)
    }
}
