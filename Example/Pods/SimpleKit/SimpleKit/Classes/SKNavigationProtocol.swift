//
//  SKNavigationController.swift
//  Pods
//
//  Created by Amr Omran on 12/27/2018.
//

import UIKit

public protocol SKNavigationProtocol {
    
    
    func push(storyboard: String, bundle: Bundle?, viewControllerIdentifier: String, animated: Bool)
    func push(viewController: UIViewController, animated: Bool)
    func presentViewController(storyboard: String, bundle: Bundle?, viewControllerIdentifier: String, animated: Bool)
    func setNewRoot(storyboard: String, bundle: Bundle?,viewControllerIdentifier: String, appDelegate: UIApplicationDelegate)
    func setNewRoot(viewController: UIViewController, appDelegate: UIApplicationDelegate)
}

public extension SKNavigationProtocol where Self : UIViewController {
    
    /**
     Navigate to another UIViewController from UIStoryBoard and put it in the stack of UIViewControllers.
     - Parameter storyboard: UIStoryBoard name.
     - Parameter bundle: Bundle.
     - Parameter viewControllerIdentifier: UIViewController identifier in the storyboard
     - Parameter animated: Boolean.
     */
    func push(storyboard: String, bundle: Bundle?, viewControllerIdentifier: String, animated: Bool) {
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    /**
     Navigate to another UIViewController and put it in the stack of UIViewControllers.
     - Parameter viewController: UIViewController.
     - Parameter animated: Boolean.
     */
    func push(viewController: UIViewController, animated: Bool) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    
    /**
     presentViewController UIViewController from UIStoryBoard.
     - Parameter storyboard: UIStoryBoard name.
     - Parameter bundle: Bundle.
     - Parameter viewControllerIdentifier: UIViewController identifier in the storyboard
     - Parameter animated: Boolean.
     */
    func presentViewController(storyboard: String, bundle: Bundle?, viewControllerIdentifier: String, animated: Bool) {
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        let nav = UINavigationController(rootViewController: vc)
        self.present(nav, animated: animated, completion: nil)
    }
    
    
    /**
     setNewRoot clear the ViewControllers stack and create new root
     - Parameter storyboard: UIStoryBoard name.
     - Parameter bundle: Bundle.
     - Parameter viewControllerIdentifier: UIViewController identifier in the storyboard
     - Parameter appDelegate: UIApplication.shared.delegate as! AppDelegate
     */
    func setNewRoot(storyboard: String, bundle: Bundle?, viewControllerIdentifier: String, appDelegate: UIApplicationDelegate) {
        
        let storyboard = UIStoryboard(name: storyboard, bundle: bundle)
        let vc = storyboard.instantiateViewController(withIdentifier: viewControllerIdentifier)
        let nav = UINavigationController(rootViewController: vc)
        if let window = appDelegate.window {
            window?.rootViewController = nav
        }
    }
    
    
    /**
     setNewRoot clear the ViewControllers stack and create new root without UIStoryboard
     - Parameter viewController: UIViewController.
     - Parameter appDelegate: UIApplication.shared.delegate as! AppDelegate.
     */
    func setNewRoot(viewController: UIViewController, appDelegate: UIApplicationDelegate) {
        let nav = UINavigationController(rootViewController: viewController)
        if let window = appDelegate.window {
            window?.rootViewController = nav
        }
    }
    
}

