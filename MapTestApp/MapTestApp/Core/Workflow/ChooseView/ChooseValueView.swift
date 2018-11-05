//
//  ChooseValueView.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

class ChooseValueView: UIControl {
    
    weak var delegate:AnyObject?
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var darkMask: UIView!
    @IBOutlet weak var pickerView: UIView!
    @IBOutlet weak var picker: UIPickerView!
    
    var dataForPickerData : [Any]!
    var chosenValue : Any? =  nil
    
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)!
        self.loadFromNib()
    }
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        self.loadFromNib()
    }
    
    
    func loadFromNib()
    {
        let xibName = "\(self.classForCoder)"
        let views = Bundle.main.loadNibNamed(xibName, owner: self, options: nil)
        
        if let view = views!.first as? UIView
        {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
    
    
    
    static func lastView () -> UIView   {
        return UIApplication.shared.keyWindow!.subviews.last!
    }
    
    
    class func instance(image:UIImage,pickerData : [Any], delegate : AnyObject) -> ChooseValueView
    {
        let lastView = self.lastView()
        let chosenView = ChooseValueView(frame: lastView.bounds)
        
        lastView.addSubview(chosenView)
        chosenView.animationShow()
        chosenView.backgroundImageView.image = image
        chosenView.dataForPickerData = pickerData
        chosenView.picker.dataSource = chosenView
        chosenView.picker.delegate = chosenView
        chosenView.delegate          = delegate
        return chosenView
    }
    
    private func animationShow() {
        
        
        let rect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        self.darkMask.alpha     = 0.0
        self.pickerView.frame    = CGRect(x: 0, y: self.frame.height, width: self.frame.size.width,  height: self.darkMask.frame.size.height)
        self.darkMask.isHidden    = false
        UIView.animate(withDuration: 0.35, animations: {
            
            self.backgroundImageView.frame = rect
            self.darkMask.alpha  = 0.2
            
        }) { (result:Bool) in
        }
    }
    
    
    @IBAction func chooseValuePressed(_ sender: UIBarButtonItem) {
        self.animationHide()
    }
    
    
    private func animationHide() {
        
        let finishRect = CGRect(x: 0, y: self.frame.height, width: self.frame.size.width,  height: self.pickerView.frame.size.height)
        
        UIView.animate(withDuration: 0.35, animations: {
            
            self.pickerView.frame           = finishRect
            self.backgroundImageView.frame = self.bounds
            
        }) { (result:Bool) in
            
            guard let del = self.delegate  as? SettingsMapViewController else   {
                return
            }
            if self.chosenValue == nil{
                if self.dataForPickerData.count>0{
                    self.chosenValue = self.dataForPickerData[0]
                }
            }
            del.chooseValuePressed(anyValue: self.chosenValue)
            self.removeFromSuperview()
        }
    }
    
}
