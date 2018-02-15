//
//  BoringViewController.swift
//  XcodeTour
//
//  Created by Paige Plander on 9/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

// this view controller may be boring, but its lifecycle isn't!
class BoringViewController: UIViewController {

    @IBOutlet weak var boringLabel: UILabel!
    
    // TODO: Starting from 1, fill in the order these methods are called. If the method is never called, leave it `nil`.
    var viewControllerEventOrder: [String: Int?] = [
        "viewDidAppear": 4,
        "viewDidDisappear": 6,
        "init()": nil,
        "viewDidLoad": 2,
        "init(nibName:bundle:)": nil,
        "init?(coder:)": 1,
        "viewWillDisappear": 5,
        "viewWillAppear": 3
    ]
    
    // MARK: - Initialization methods
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: - View event notification methods
    override func viewDidLoad() {
        super.viewDidLoad()
        boringLabel.textColor = UIColor.green
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

    // MARK: - Action methods (Ignore)
    @IBAction func boringButtonWasPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToAnotherBoringViewController", sender: sender)
    }

}
