//
//  ViewController.swift
//  Storm Viewer
//
//  Created by Вячеслав Ефимов on 31.12.2020.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Storm Viewer"
        
        let fm = FileManager.default
        
        // bundle is a directory containing compiled program and all assets
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = "Image \(indexPath.row + 1)"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let dvc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
            dvc.selectedImage = pictures[indexPath.row]
            dvc.displayedImageName = "Image \(indexPath.row + 1)"
            
            // pushing dvc onto the navigation controller
            navigationController?.pushViewController(dvc, animated: true)
        }
    }


}

