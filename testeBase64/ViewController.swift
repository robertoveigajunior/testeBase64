//
//  ViewController.swift
//  testeBase64
//
//  Created by Roberto Luiz Veiga Junior on 25/01/19.
//  Copyright © 2019 RLVJR. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var viewPhoto: UIView!
    @IBOutlet weak var imageView: UIImageView!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    func camera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
            self.present(imagePicker, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func play(_ sender: Any) {
        self.imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func showActionSheet(vc: UIViewController) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        vc.present(actionSheet, animated: true, completion: nil)
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageView.image = image
        }else{
            print("Something went wrong")
        }
        self.dismiss(animated: true, completion: nil)
    }
}
