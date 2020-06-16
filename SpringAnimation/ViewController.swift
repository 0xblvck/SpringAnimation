//
//  ViewController.swift
//  SpringAnimation
//
//  Created by Sergey on 11.06.2020.
//  Copyright © 2020 Sergey. All rights reserved.
//

import UIKit
import Spring

class ViewController: UIViewController {
    
    @IBOutlet weak var animationView: SpringView!
    @IBOutlet weak var animationButton: SpringButton!
    @IBOutlet weak var animationLabel: UILabel!
    @IBOutlet weak var animationCounterLabel: UILabel!
    
    private var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }

    @IBAction func showAnimation(_ sender: SpringButton) {
        
        if currentIndex >= animationTypes.count {
            currentIndex = 0
        }
        
        animationView.animation = animationTypes[currentIndex]
        animationView.delay = 0.5
        animationView.duration = 2
        animationView.animate()
        
        animationLabel.text = animationTypes[currentIndex]
        animationLabel.isHidden = false
        animationButton.setTitle("Next animation", for: .normal)
        animationCounterLabel.text = "\(currentIndex + 1) of \(animationTypes.count)"
        currentIndex += 1
    }
}

extension ViewController {
    
    func updateUI() {
        animationView.layer.cornerRadius = 15
        animationButton.layer.cornerRadius = 12
        animationButton.setTitle("Show animation", for: .normal)
        animationLabel.isHidden = true
        animationCounterLabel.text = "0 of \(animationTypes.count)"
    }
}

