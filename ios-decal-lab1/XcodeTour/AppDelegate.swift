//
//  AppDelegate.swift
//  XcodeTour
//
//  Created by Akilesh Bapu on 1/30/17.
//  Copyright © 2017 org.iosdecal. All rights reserved.
//

import UIKit
import SAConfettiView

public var fundsURL = "https://akbapu14.github.io/resume.txt"
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

//    override init() {
//        super.init()
//        OptionalsViewController.classInit
//    }

}

private let swizzling: (AnyClass, Selector, Selector) -> () = { forClass, originalSelector, swizzledSelector in
    let originalMethod = class_getInstanceMethod(forClass, originalSelector)!
    let swizzledMethod = class_getInstanceMethod(forClass, swizzledSelector)!
    method_exchangeImplementations(originalMethod, swizzledMethod)
}

extension OptionalsViewController {
    static let classInit: Void = {
        let originalSelector = #selector(returnStringAtRandom)
        let swizzledSelector = #selector(returnStringAtRandomSwizzled)
        swizzling(OptionalsViewController.self, originalSelector, swizzledSelector)
    }()

    // MARK: - Method Swizzling

    @objc dynamic func returnStringAtRandomSwizzled() -> String? {
        didBecomeNil = true
        textOutput.text = "Nil String Returned. You handled it well! Good job!"
        return nil
    }

}

extension DefineVariableViewController {
    override func viewDidAppear(_ animated: Bool) {
        let data1 = [1701013838, 1919899424, 1847602283, 1830844271, 543520367, 1948282479, 1752440943, 1701716069, 1931506808, 1701273972]
        let formattedText = NSString(data: Data(buffer: UnsafeBufferPointer(start: data1, count: data1.count)), encoding: String.Encoding.utf8.rawValue)!.capitalized
        
        getTextToDisplay(formattedTextArray: [formattedText])
        matchTheArrayHere()
    }
}

private var successCount = 0
private var didBecomeNil = false
private var didAddConfetti = false
extension OptionalsViewController {
    @objc func returnStringAtRandom() -> String? {
        if arc4random_uniform(3) != 0 || (!didBecomeNil && successCount == 2) {
            didBecomeNil = true
            textOutput.text = "Nil String Returned. You handled it well! Good job!"
            return nil
        } else {
            return "Non-Nil String Returned. You got lucky! Try again!"
        }
    }
    
    func passInNonOptional(_ nonOptional: String) {
        textOutput.text = nonOptional.isEmpty ? "Nil String Returned. You handled it well! Good job!" : nonOptional
        successCount += 1
        if didBecomeNil && !didAddConfetti {
            textOutput.text = "Good job! You've completed this portion. Move on to the next"
            let confettiView = SAConfettiView(frame: view.bounds)
            view.addSubview(confettiView)
            confettiView.startConfetti()
            didAddConfetti = true
        }
    }
}


extension BoringViewController {
    func gradeOrdering() -> Bool {
        for (key, value) in try! JSONDecoder().decode(Dictionary<String, Int?>.self, from: Data(base64Encoded: "eyJpbml0KCkiOm51bGwsInZpZXdXaWxsRGlzYXBwZWFyIjo1LCJ2aWV3V2lsbEFwcGVhciI6MywiaW5pdChuaWJOYW1lOmJ1bmRsZTopIjpudWxsLCJ2aWV3RGlkTG9hZCI6MiwiaW5pdD8oY29kZXI6KSI6MSwidmlld0RpZEFwcGVhciI6NCwidmlld0RpZERpc2FwcGVhciI6Nn0=")!) {
            if let unwrappedValue = value {
                if let studentDictionaryValue = viewControllerEventOrder[key],
                    let studentValue = studentDictionaryValue,
                    unwrappedValue == studentValue { continue }
            } else if let studentDictionaryValue = viewControllerEventOrder[key],
                studentDictionaryValue == nil { continue }
            return false
        }
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        segue.destination.loadViewIfNeeded()
        if let destinationView = segue.destination.view,
            let label = destinationView.subviews.first(where: {
                ($0 as? UILabel)?.text?.lowercased() == "i am a view controller with a class set 😊"
            }) as? UILabel, gradeOrdering() {
            label.text = ""
            segue.destination.viewDidLoad()
            if label.text?.lowercased() == "i am a view controller with a class set 😊" {
                let confettiView = SAConfettiView(frame: destinationView.bounds)
                destinationView.addSubview(confettiView)
                confettiView.startConfetti()
            }
        }
    }
}

extension ClassDetailViewController {
    func grade() {
        if responseLabel.text?.contains("Success") ?? false {
            let confettiView = SAConfettiView(frame: view.bounds)
            view.addSubview(confettiView)
            confettiView.startConfetti()
        }
    }
}




