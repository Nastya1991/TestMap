//
//  ChooseValueView_Picker.swift
//  MapTestApp
//
//  Created by Nastya on 11/4/18.
//  Copyright © 2018 Nastya. All rights reserved.
//

import UIKit

extension ChooseValueView :UIPickerViewDelegate, UIPickerViewDataSource {
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return 50.0
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.dataForPickerData.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.chosenValue = self.dataForPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView
    {
        let pickerLabel = UILabel()
        pickerLabel.text = self.titleForRow(row: row)
        
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }
    
    // MARK: - Private
    private func titleForRow(row: Int)->String{
        
        if let value = self.dataForPickerData[row] as? MapTypealias{
            return value.title
        }
        
        return ""
    }
    
}
