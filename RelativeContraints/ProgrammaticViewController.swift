//
//  ProgrammaticViewController.swift
//  RelativeContraints
//
//  Created by Chris Law on 12/17/19.
//  Copyright © 2019 Chris Law. All rights reserved.
//

import UIKit


/*
 Example of programmatically implementing constraints on a view(blueView) so
 it's distance from another view(redView) is always proportional to it's size
 while the size of both is relative to the controller's view.
 */
class ProgrammaticViewController: UIViewController {

    let redView = UIView()
    let blueView = UIView()
    
    var blueViewCenterXConstraint: NSLayoutConstraint!
    var blueViewCenterYConstraint: NSLayoutConstraint!
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blueViewCenterXConstraint.constant = blueView.frame.size.width - blueView.frame.size.width*0.1
        blueViewCenterYConstraint.constant = blueView.frame.size.height/2 + blueView.frame.size.height*0.1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        redView.backgroundColor = .systemRed
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        blueView.backgroundColor = .systemBlue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(redView)
        view.addSubview(blueView)
        
        redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50).isActive = true
        redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.widthAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        blueView.heightAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
        
        blueViewCenterXConstraint = blueView.centerXAnchor.constraint(equalTo: redView.centerXAnchor)
        blueViewCenterXConstraint.isActive = true
        
        blueViewCenterYConstraint = blueView.centerYAnchor.constraint(equalTo: redView.centerYAnchor)
        blueViewCenterYConstraint.isActive = true
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
