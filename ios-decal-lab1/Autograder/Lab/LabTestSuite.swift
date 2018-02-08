//
//  CategoryViewControllerTestCases.swift
//  PokedexLabTests
//
//  Created by Chris Zielinski on 7/22/17.
//  Copyright © 2017 iOS Development Decal. All rights reserved.
//

import UIKit
import XCTest
import BKAutograder
@testable import XcodeTour

final class LabTestSuite: BKTestSuite, BKAutogradable {
    
    var gradingFileName: String = "LabTestSuite"
    
    var storyboard: UIStoryboard!
    var keyWindow: UIWindow!
//    var defineVariableViewController: DefineVariableViewController!
    
    func testQ0Existence() {
        let mainStoryboardName: String = BKAssertNotNil(Bundle.main.object(forInfoDictionaryKey: "UIMainStoryboardFile"))
        storyboard = UIStoryboard(name: mainStoryboardName, bundle: nil)
        keyWindow = BKAssertNotNil(UIApplication.shared.keyWindow)
    }
    
    func testQ1() {
        let defineVariableViewController: DefineVariableViewController = BKAssertStoryboardViewController(withIdentifier: "__q1", from: storyboard)
        keyWindow.rootViewController = defineVariableViewController
        BKLoadView(in: defineVariableViewController)
        
        let niceWorkViewController: NiceWorkViewController = BKAssertNotNil(defineVariableViewController.presentedViewController)
        
        let data1 = [1701013838, 1919899424, 1847602283, 1830844271, 543520367, 1948282479, 1752440943, 1701716069, 1931506808, 1701273972]
        let formattedText = NSString(data: Data(buffer: UnsafeBufferPointer(start: data1, count: data1.count)), encoding: String.Encoding.utf8.rawValue)!.capitalized
        BKAssertEqualUnordered([formattedText], otherArray: niceWorkViewController.textToDisplay)
    }

    func testQ2() {
        let optionalsViewController: OptionalsViewController = BKAssertStoryboardViewController(withIdentifier: "__q2", from: storyboard)
        keyWindow.rootViewController = optionalsViewController
        BKLoadView(in: optionalsViewController)
        
        let generateStringButton = BKAssertButton(withLabelContaining: [["generate string"]], inSubviewsOf: optionalsViewController.view)
        optionalsViewController.testForOptional(generateStringButton)
        
        BKAssertLabel(inSubviewsOf: optionalsViewController.view, contains: [["good job"]])
    }

    func testQ3() {
        let boringViewController: BoringViewController = BKAssertStoryboardViewController(withIdentifier: "__q3", from: storyboard)
        keyWindow.rootViewController = boringViewController
        BKLoadView(in: boringViewController)
        
        boringViewController.performSegue(withIdentifier: "goToAnotherBoringViewController", sender: nil)
        
        let viewController: UIViewController = BKAssertNotNil(boringViewController.presentedViewController)
        
        let confettiView: AnyClass = NSClassFromString("SAConfettiView.SAConfettiView")!
        BKAssertNotNil(viewController.view.subviews.first(where: { $0.isKind(of: confettiView) }))
    }

    func testQ4() {
        let navigationController: UINavigationController = BKAssertStoryboardViewController(withIdentifier: "__q4", from: storyboard)
        keyWindow.rootViewController = navigationController
        BKLoadView(in: navigationController)
        
        let classListViewController: ClassListViewController = BKAssertNotNil(navigationController.visibleViewController)
        classListViewController.tableView(classListViewController.tableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        BKRun(for: 1)
        
        let presentedAlertController: UIAlertController = BKAssertNotNil(classListViewController.presentedViewController)
        let firstAction: UIAlertAction = BKAssertNotNil(presentedAlertController.actions.first)
        BKDismiss(alertController: presentedAlertController, with: firstAction)
        
        while !(navigationController.topViewController?.isKind(of: ClassDetailViewController.self) ?? false) {
            BKRun(for: 1)
        }
        
        let classDetailViewController = navigationController.topViewController as! ClassDetailViewController
        
        let confettiView: AnyClass = NSClassFromString("SAConfettiView.SAConfettiView")!
        BKAssertNotNil(classDetailViewController.view.subviews.first(where: { $0.isKind(of: confettiView) }))
    }
    
}





