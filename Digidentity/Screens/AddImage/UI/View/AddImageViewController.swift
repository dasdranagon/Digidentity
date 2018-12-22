//
//  AddImageViewController.swift
//  Digidentity
//
//  Created by Denis Skokov on 13/12/2018.
//  Copyright © 2018 Dennis Skokov. All rights reserved.
//

import UIKit

class AddImageViewController: UIViewController {
    var intentObserver: AddImageIntentObserver!
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var uploadButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                            target: self,
                                                            action: #selector(close))
        
        intentObserver.ready()
    }
}

extension AddImageViewController {
    @IBAction func takePhoto(_ sender: Any) {
        intentObserver.takePhoto()
    }
    
    @IBAction func upload(_ sender: Any) {
        intentObserver.upload()
    }
    
    @objc func close() {
        intentObserver.close()
    }
}

extension AddImageViewController: AddImageRepresentation {
    func uploadButton(show: Bool) {
        uploadButton.isHidden = !show
    }
    
    func show(image: UIImage) {
        photoImageView.image = image
    }
    
    func show(text: String) {
        textLabel.text = text
    }
}

extension AddImageViewController: ErrorHandler {}
