//
//  ViewController.swift
//  RelativeContraints
//
//  Created by Chris Law on 12/17/19.
//  Copyright © 2019 Chris Law. All rights reserved.
//

import UIKit

/*
 Example of using Storyboard to implement constraints on a view(blueView) so
 it's distance from another view(redView) is always proportional to it's size
 while the size of both is relative to the controller's view.
*/
class StoryboardViewController: UIViewController {
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    
    @IBOutlet weak var blueViewCenterXConstraint: NSLayoutConstraint!
    @IBOutlet weak var blueViewCenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        blueViewCenterXConstraint.constant = blueView.frame.size.width
        blueViewCenterYConstraint.constant = blueView.frame.size.height
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

