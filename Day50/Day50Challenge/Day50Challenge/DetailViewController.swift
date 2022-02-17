//
//  DetailViewController.swift
//  Day50Challenge
//
//  Created by İbrahim Demirci on 17.02.2022.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var selectedImage: UIImageView!
    @IBOutlet var captionLabel: UILabel!
    
    var selectedItem: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let selectedItem = selectedItem {
            let path =  getDocumentsDirectory().appendingPathComponent(selectedItem.fileName)
            selectedImage.image = UIImage(contentsOfFile: path.path)
            captionLabel.text = selectedItem.caption
            
        }
        // Do any additional setup after loading the view.
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


}
