//
//  ViewController.swift
//  CookForMe
//
//  Created by Ahir on 03/04/24.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.redirectToHomeScreen()
        }
        hideNavigationBar()
    }

    private func redirectToHomeScreen() {
        let ctrl = storyboard?.instantiateViewController(withIdentifier: LandingViewController.identifier) as? LandingViewController
        if let ctrl = ctrl {
            navigationController?.pushViewController(ctrl, animated: true)
        }
    }
    
    private func hideNavigationBar() {
        navigationController?.navigationBar.isHidden = true
    }

}

extension UIViewController {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
