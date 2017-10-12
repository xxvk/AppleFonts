//
//  MasterViewModel.swift
//  SwiftFonts
//
//  Created by xxvk on 2017/10/12.
//  Copyright (c) 2017 Reform@Tech. All rights reserved.
//

import UIKit

class MasterViewModel
{
    var familyNames : [String]
    var fonts = [String: [String]]()

    init()
    {
        let unsortedFamilyNames = UIFont.familyNames
        familyNames = unsortedFamilyNames.sorted()
        
        let sorter = FontSorter()
        for familyName in familyNames
        {
            let unsortedFontNames = UIFont.fontNames(forFamilyName: familyName)
            fonts[familyName] = sorter.sortFontNames(array: unsortedFontNames)
        }
    }
    
    func numberOfSections() -> Int
    {
        return familyNames.count
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int
    {
        let key = familyNames[section]
        let array = fonts[key]!
        return array.count
    }
    
    func titleAtIndexPath(_ indexPath: IndexPath) -> String
    {
        let key = familyNames[indexPath.section]
        let array = fonts[key]
        let fontName = array![indexPath.row]
        return fontName
    }
}
