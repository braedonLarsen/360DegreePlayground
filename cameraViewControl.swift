//
//  cameraViewControl.swift
//  360DegreePlayground
//
//  Created by BRAEDON LARSEN on 3/7/23.
//

import UIKit

class cameraViewControl: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    let imagePicker = UIImagePickerController()
    var addImage = UIImage()
    override func viewDidLoad() {
        imagePicker.delegate = self
        super.viewDidLoad()
	
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var viewImageOutler: UIImageView!
    @IBOutlet weak var imageDebugOutlet: UIImageView!
    @IBOutlet weak var xValueStepper: UIStepper!
    @IBOutlet weak var yValueStepper: UIStepper!
    @IBOutlet weak var xValueText: UILabel!
    @IBOutlet weak var directionSegmentOutlet: UISegmentedControl!
    @IBOutlet weak var yValueText: UILabel!
    var newX = 0
    var newY = 0
    var newDirection = 0
    
    
    
    @IBAction func xValueAction(_ sender: Any) {
        if Int(xValueStepper.value) <= AppData.ARRAY_SIZE_X
        {
            newX = Int(xValueStepper.value)
            xValueText.text = "X Value: \(newX)"
            print("newX: \(newX)")
        }
    }
    
    @IBAction func yValueAction(_ sender: Any) {
        if Int(yValueStepper.value) <= AppData.ARRAY_SIZE_Y
        {
            newY = Int(yValueStepper.value)
            yValueText.text = "Y Value: \(newY)"
            print("newY: \(newY)")
        }

    }
    @IBAction func segmentDirectionAction(_ sender: Any) {
        newDirection = directionSegmentOutlet.selectedSegmentIndex
    }
    
    @IBAction func cameraAction(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func addObjectAction(_ sender: Any) {
        switch newDirection {
        case 0:
            AppData.secondFloor2DNorth[newX][newY].imageNorth = addImage
            print("addNorth")
            AppData.didUpdate = true
            break
        case 1:
            AppData.secondFloor2DNorth[newX][newY].imageEast = addImage
            print("addEast")
            AppData.didUpdate = true
            

            break
        case 2:
            AppData.secondFloor2DNorth[newX][newY].imageSouth = addImage
            print("addSouth")
            AppData.didUpdate = true

            break
        
        case 3:
            AppData.secondFloor2DNorth[newX][newY].imageWest = addImage
            print("addWest")
            AppData.didUpdate = true

            break
        default:
            AppData.secondFloor2DNorth[newX][newY].imageNorth = addImage
            print("addDefault")
            AppData.didUpdate = true

            
        }
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        picker.dismiss(animated: true)
        self.addImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        viewImageOutler.image = addImage
    }
}

