//
//  ShowViewController.swift
//  Schedule
//
//  Created by Tuong Pham on 5/12/18.
//  Copyright © 2018 Tuong Pham. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {
    
    @IBOutlet weak var showImage: UIImageView!
    
    @IBOutlet weak var showRating: UILabel!
    @IBOutlet weak var showDuration: UILabel!
    @IBOutlet weak var showTitle: UILabel!
    var show : Show?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        showImage.image = UIImage(named: show?.imageChannel ?? "download")
        showTitle.text = show?.title
        showDuration.text = "Duration: " + (show?.startTime ?? "Not Available") + " - " + (show?.endTime ?? "Not Available")
        showRating.text = "Rating: " + (show?.rating ?? "Not Available")
        
        let button = UIButton(type: .roundedRect)
       
        
        self.view.addSubview(button)
        
        let margin = view.layoutMarginsGuide
        
        
        button.bottomAnchor.constraint(equalTo: margin.bottomAnchor).isActive = true
        button.leadingAnchor.constraint(equalTo: margin.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: margin.trailingAnchor).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        button.backgroundColor = .blue
        button.setTitle("Test", for: .normal)
        button.addTarget(self, action: #selector(tapped), for: .touchUpInside)
        
        
    }
    
    @IBAction func tapped(sender: UIButton) {
        print("tapped")
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
