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
    
    var shouldAddHexagon = true
    
    @IBOutlet weak var hexagonsSwitch: UISwitch!
    
    @IBAction func toggleHexagons(_ sender: Any) {
        if let sender = sender as? UISwitch {
            shouldAddHexagon = sender.isOn
            self.view.setNeedsLayout()
        }
    }
    
    func updateHexagon(to view: UIView, color: UIColor) {
        view.subviews.forEach { (subview) in
            subview.removeFromSuperview()
        }
        
        if shouldAddHexagon {
        
            let config = UIImage.SymbolConfiguration(pointSize: view.frame.size.width, weight: .light)
            guard let hexagonImage = UIImage(systemName: "hexagon", withConfiguration: config),
                  let cgImage = hexagonImage.cgImage else { return }
            
            let rotatedImage = UIImage(cgImage: cgImage, scale: hexagonImage.scale, orientation: .right).withRenderingMode(.alwaysTemplate)
            let imageView = UIImageView(image: rotatedImage)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.tintColor = color
            view.addSubview(imageView)
            
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

            view.backgroundColor = .clear
        } else {
            view.backgroundColor = color
        }
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        blueViewCenterXConstraint.constant = blueView.frame.size.width * 0.9
        blueViewCenterYConstraint.constant = blueView.frame.size.height * 0.5
        
        updateHexagon(to: redView, color: .systemRed)
        updateHexagon(to: blueView, color: .systemBlue)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        hexagonsSwitch.isOn = shouldAddHexagon
        
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
