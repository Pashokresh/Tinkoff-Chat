//
//  ViewController.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 02.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var aboutSelfLabel: UILabel!
    @IBOutlet weak var imageLabel: UILabel!
    @IBOutlet weak var informationTextView: UITextView!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var textColorLabel: UILabel!
    
    var imagePicker: UIImagePickerController!
    
    //MARK: UIViewController Life Cycle Methods
    
    override func loadView() {
        super.loadView()
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
        
        self.userNameTextField.delegate = self
        self.informationTextView.delegate = self
        
        photoImageView.isUserInteractionEnabled = true

        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        let tapGestureForView = UITapGestureRecognizer(target: self, action: #selector(self.hideKeyboard))
        self.view.addGestureRecognizer(tapGestureForView)
        
        let tapGestureForImage = UITapGestureRecognizer(target: self, action: #selector(self.choosePhotoAction))
        photoImageView.addGestureRecognizer(tapGestureForImage)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        print("\n\(#function)\n")
        for subview in self.view.subviews {
            print("\(subview.description)\n")
        }
    }
    
    //MARK: - Actions
    
    func hideKeyboard() {
        self.view.endEditing(true)
    }
    
    func choosePhotoAction() {
        
        self.hideKeyboard()
        
        let alert = UIAlertController(title: nil, message: "Выберете источник фото", preferredStyle: .actionSheet)
        
        let chooseFromLibararyAvtion = UIAlertAction(title: "Выбрать фото из библиотеки", style: .default) { void in
            self.photoFromLibrary()
        }
        alert.addAction(chooseFromLibararyAvtion)
        
        let shootPhotoAction = UIAlertAction(title: "Сделать фото", style: .default) { void in
            self.shootPhoto()
        }
        alert.addAction(shootPhotoAction)
        
        let deletePhotoAction = UIAlertAction(title: "Удалить фото", style: .destructive) { void in
            
            let placeHolderImage = UIImage(named: "placeHolder")
            self.photoImageView.contentMode = .scaleAspectFit
            self.photoImageView.image = placeHolderImage
        }
        alert.addAction(deletePhotoAction)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { void in
            self.dismiss(animated: true, completion: nil)
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func saveAction(_ sender: Any) {
        
        print("Сохранение данных профиля")
        self.dismiss(animated: true, completion: {})
    }
    
    @IBAction func changeColorAction(_ sender: Any) {
        
        guard let sender = sender as? UIButton else{return}
        
        self.textColorLabel.textColor = sender.backgroundColor
        
    }
    
    //MARK: Photo methods
    
    func photoFromLibrary() {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        imagePicker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
        imagePicker.modalPresentationStyle = .popover
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    func shootPhoto() {
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.allowsEditing = false
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.cameraCaptureMode = .photo
            imagePicker.modalPresentationStyle = .fullScreen
            present(imagePicker,animated: true,completion: nil)
        } else {
            noCamera()
        }
    }
    
    func noCamera() {
        
        let alertVC = UIAlertController(title: "Нет камеры", message: "В устройстве нет камеры", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style:.default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
        
    }
    
    //MARK: - Text Field Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        
        return true
    }
    
    //MARK: - Text View Delegate
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    //MARK: - Image Picker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        var chosenImage = UIImage()
        chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        photoImageView.contentMode = .scaleAspectFit
        photoImageView.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func availableCaptureModes(for cameraDevice: UIImagePickerControllerCameraDevice) -> [NSNumber]? {
        return [0]
    }
}

