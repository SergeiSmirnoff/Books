//
//  DetailBookViewController.swift
//  Books
//
//  Created by albert on 21.04.2018.
//  Copyright © 2018 Сергей. All rights reserved.
//

import UIKit

class DetailBookViewController: UIViewController {
    @IBOutlet var bookImage: UIImageView!
    @IBOutlet var bookDescription: UITextView!
    var book:Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bookImage.image = book?.picture
        bookDescription.text = book?.bookContent
    }
    @IBAction func closeVC() {
        let alertVC = UIAlertController(title: "", message: "1", preferredStyle: .actionSheet)
        let alertAction1 = UIAlertAction(title: "No", style: .cancel, handler: nil)
        let alertAction2 = UIAlertAction(title: "YES", style: .default) { _ in
           self.dismiss(animated: true, completion: nil)
        }
        
        let alertAction3 = UIAlertAction(title: "aa", style: .default) { alert in
            print(alert)
        }
        alertVC.addAction(alertAction1)
        alertVC.addAction(alertAction2)
        alertVC.addAction(alertAction3)
        present(alertVC, animated: true, completion: nil)
    }

}
