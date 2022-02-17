//
//  ViewController.swift
//  Day50Challenge
//
//  Created by İbrahim Demirci on 17.02.2022.
//

import UIKit

class ViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        if let savedItems = ud.object(forKey: "items") as? Data {
            let decoder = JSONDecoder()
            do {
                items = try decoder.decode([Item].self, from: savedItems)
            } catch {
                print("failed to load peoples")
            }
            
        }
        
        title = "Item Keeper"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(selectImage))
    }
    
    @objc func selectImage() {
        let picker = UIImagePickerController()
//        picker.sourceType = .camera
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
        
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CellTableViewCell
            
        let item = items[indexPath.row]

        let path = getDocumentsDirectory().appendingPathComponent(item.fileName)
        cell.customImage.image = UIImage(contentsOfFile: path.path)
        print("cell var")

        return cell
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        let item = Item(fileName: imageName, caption: "unknown")
        items.append(item)
        tableView.reloadData()
        save()
        dismiss(animated: true)
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as! DetailViewController
        vc.selectedItem = items[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)
    }

    func save() {
        
        let encoder = JSONEncoder()
        if let savedData = try? encoder.encode(items) {
            let ud = UserDefaults.standard
            ud.set(savedData, forKey: "items")
        }
        
    }
}

