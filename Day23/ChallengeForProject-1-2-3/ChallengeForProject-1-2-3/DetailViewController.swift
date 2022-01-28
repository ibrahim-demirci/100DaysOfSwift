//
//  DetailViewController.swift
//  ChallengeForProject-1-2-3
//
//  Created by İbrahim Demirci on 28.01.2022.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedImage = selectedImage {
            imageView.image = UIImage(named: selectedImage)
        }
        // Do any additional setup after loading the view.
    }
    


}
