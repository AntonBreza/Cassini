//
//  CassiniViewController.swift
//  Cassini
//
//  Created by 11 on 09.09.16.
//  Copyright © 2016 11. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate {
    
    fileprivate struct Storyboard {
        static let ShowImageSeque = "Show Image"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.ShowImageSeque {
            if let ivc = segue.destination.contentViewController as? ImageViewController {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName)
                ivc.title = imageName

            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    @IBAction func showDetail(_ sender: UIButton) {
        if let ivc = splitViewController?.viewControllers.last?.contentViewController as? ImageViewController {
            let imageName = sender.currentTitle
            ivc.imageURL = DemoURL.NASAImageNamed(imageName)
            ivc.title = imageName
        } else {
            performSegue(withIdentifier: Storyboard.ShowImageSeque, sender: sender)
        }
    }

    func splitViewController( _ splitViewController: UISplitViewController,
                              collapseSecondary secondaryViewController: UIViewController,
                              onto primaryViewController: UIViewController) -> Bool
    {
        if primaryViewController.contentViewController == self {
            if let ivc = secondaryViewController.contentViewController as? ImageViewController , ivc.imageURL == nil {
                return true
            }
        }
        return false
    }
}



extension UIViewController {
    var contentViewController: UIViewController {
        if let navcon = self as? UINavigationController {
            return navcon.visibleViewController ?? self
        } else {
            return self
        }
    }
}
