//
//  OptionalsViewController.swift
//  XcodeTour
//
//  Created by Akilesh Bapu on 1/30/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit
import GameKit
class OptionalsViewController: UIViewController {

    @IBOutlet weak var textOutput: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func testForOptional(_ sender: Any) {
        // TODO: Implement proper usage of optionals to prevent app from crashing
        let randomString = returnStringAtRandom()
        if let myString = randomString {
            passInNonOptional(randomString!)
        }
    }

}
