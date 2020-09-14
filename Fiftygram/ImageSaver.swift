//
//  ImageSaver.swift
//  Fiftygram
//
//  Created by Timur Toktassynov on 9/14/20.
//  Copyright © 2020 CS50. All rights reserved.
//

import UIKit

class ImageSaver: NSObject {
    var succesHandler: (()-> Void)?
    var errorHandler: ((Error)-> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?,
                         contextInfo: UnsafeRawPointer) {
        if let error = error {
            errorHandler?(error)
        }
        else {
            succesHandler?()
        }
    }
}
