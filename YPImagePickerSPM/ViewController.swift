//
//  ViewController.swift
//  YPImagePickerSPM
//
//  Created by Fernando Valverde on 18/4/21.
//

import UIKit
import YPImagePicker

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func presentImagePicker(_ sender: Any) {
        var config = YPImagePickerConfiguration()
        config.shouldSaveNewPicturesToAlbum = false
        config.startOnScreen = YPPickerScreen.library
        config.library.onlySquare = false
        config.library.isSquareByDefault = false
        config.showsCrop = .rectangle(ratio: 1.5)
        config.library.mediaType = YPlibraryMediaType.photo
        let imagePicker = YPImagePicker(configuration: config)

        imagePicker.didFinishPicking { [unowned imagePicker] items, _ in
            if let photo = items.singlePhoto {
                // Image selected now start uploading process
                print("Hi \(photo)")
            }
            imagePicker.dismiss(animated: true, completion: nil)
        }

        // This is where the app crashes
        present(imagePicker, animated: true, completion: nil)
    }
    
}

