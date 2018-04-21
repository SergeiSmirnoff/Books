//
//  BooksTableViewController.swift
//  Books
//
//  Created by Сергей on 17.04.2018.
//  Copyright © 2018 Сергей. All rights reserved.
//

import UIKit
import Foundation

struct Book {
    
    var bookName:String
    var bookAuther:String
    var bookContent:String
    var yearOfPuplishing:String
    var picture:UIImage?
    
}
    
    class BooksTableViewController: UITableViewController {
       

    
      let  book1 = Book(bookName: "«Котлы» 41-го. История ВОВ, которую мы не знали", bookAuther: "Исаев Алексей", bookContent: description1, yearOfPuplishing: "2015", picture: UIImage(named:"1"))
      let  book2 = Book(bookName: "Вся кремлевская рать. Краткая история современной России", bookAuther: "Зыгарь Михаил", bookContent: description2, yearOfPuplishing: "2017", picture: UIImage(named:"2"))
     let  book3 = Book(bookName: "Лестница в небо. Диалоги о власти, карьере и мировой элите", bookAuther: " Михаил Хазин", bookContent: description3, yearOfPuplishing: "2016", picture: UIImage(named:"3"))
     let   book4 = Book(bookName: "Патологии", bookAuther: "Захар Прилепин", bookContent: description4, yearOfPuplishing: "2004", picture: UIImage(named:"4"))
 
        var booksCollection = [Book]()
        
       
        
       
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        booksCollection = [book1,book2,book3,book4]
        tableView.reloadData()
    }

   


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksCollection.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BooksTableViewCell
       cell.bookTitle.text = booksCollection[indexPath.row].bookName
       cell.bookAuther.text = booksCollection[indexPath.row].bookAuther
        cell.bookYearOfPublishing.text = booksCollection[indexPath.row].yearOfPuplishing
       cell.bookImage.image = booksCollection[indexPath.row].picture
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
