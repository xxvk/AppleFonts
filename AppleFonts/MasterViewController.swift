//
//  MasterViewController.swift
//  SwiftFonts
//
//  Created by xxvk on 2017/10/12.
//  Copyright (c) 2017 Reform@Tech. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController
{
    let viewModel = MasterViewModel()

    //MARK: - tableview delegate
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.viewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        self.configureCell(cell: cell, at: indexPath);
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 280, height: 200))
        label.text = viewModel.titleAtIndexPath(indexPath)
        label.font = self.fontAtIndexPath(indexPath: indexPath)
        label.sizeToFit()
        return max(label.font.lineHeight + label.font.ascender + -label.font.descender, 44)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let font = self.fontAtIndexPath(indexPath: indexPath)
        
        let message_toshow = "familyName: \(font.familyName) \n fontName: \(font.fontName)"
        print(message_toshow)
        
        let alert = UIAlertController.init(title: "Font Detail", message: message_toshow, preferredStyle: .alert)
        alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - ui cofig
    func configureCell(cell: UITableViewCell, at indexPath: IndexPath)
    {
        cell.textLabel?.text = viewModel.titleAtIndexPath(indexPath)
        cell.textLabel?.font = self.fontAtIndexPath(indexPath: indexPath)
    }
    
    func fontAtIndexPath(indexPath: IndexPath) -> UIFont
    {
        let fontName = viewModel.titleAtIndexPath(indexPath)
        return UIFont(name:fontName, size: UIFont.systemFontSize)!
    }
}
