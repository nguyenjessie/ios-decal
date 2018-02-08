//
//  ClassListViewController.swift
//  XcodeTour
//
//  Created by Chris Zielinski on 9/13/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit

class ClassListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        let logo = UIImage(named: "cal_central")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        UIApplication.shared.statusBarStyle = .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Choose Class to Add"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "classCell")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Instructor Consent Required", message: "This course requires a permission code to enroll. Please input it here:", preferredStyle: .alert)
        
        let confirmAction = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let fieldText = alertController.textFields![0].text, let code = Int(fieldText) else {
                fatalError("Invalid permission code")
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showDetail", sender: code)
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addTextField { (textField) in
            textField.text = "274958"
            textField.keyboardType = .numberPad
        }
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let classDetailViewController = segue.destination as? ClassDetailViewController {
            classDetailViewController.permissionCode = sender as! Int
        }
    }

}
