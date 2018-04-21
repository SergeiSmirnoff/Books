//
//  BooksViewController.swift
//  Books
//
//  Created by albert on 21.04.2018.
//  Copyright © 2018 Сергей. All rights reserved.
//

import UIKit

class BookManager {
    func fetchBooks(completion: (([Book], Int) -> Void)) {
        let book1 = Book(bookName: "«Котлы» 41-го. История ВОВ, которую мы не знали", bookAuther: "Исаев Алексей", bookContent: description1, yearOfPuplishing: "2015", picture: UIImage(named:"1"))
        let book2 = Book(bookName: "Вся кремлевская рать. Краткая история современной России", bookAuther: "Зыгарь Михаил", bookContent: description2, yearOfPuplishing: "2017", picture: UIImage(named:"2"))
        let book3 = Book(bookName: "Лестница в небо. Диалоги о власти, карьере и мировой элите", bookAuther: " Михаил Хазин", bookContent: description3, yearOfPuplishing: "2016", picture: UIImage(named:"3"))
        let book4 = Book(bookName: "Патологии", bookAuther: "Захар Прилепин", bookContent: description4, yearOfPuplishing: "2004", picture: UIImage(named:"4"))
        sleep(2)
        let books = [book1, book2, book3, book4]
        completion(books, books.count)
    }
}

class BooksViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let bookManager = BookManager()
    var booksCollection = [Book]()

    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        
        bookManager.fetchBooks { books, count in
            self.booksCollection = books
            self.tableView.reloadData()
        }
    }

    private func registerCell () {
        let nib = UINib(nibName: "BookTableViewCell", bundle: .main)
        tableView.register(nib, forCellReuseIdentifier: "BookTableViewCell")
    }
}

extension BooksViewController: UITableViewDataSource {
    
   func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return booksCollection.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BookTableViewCell", for: indexPath) as! BookTableViewCell
        cell.bookTitle.text = booksCollection[indexPath.row].bookName
        cell.bookAuthor.text = booksCollection[indexPath.row].bookAuther
        cell.bookYearOfPublishing.text = booksCollection[indexPath.row].yearOfPuplishing
        cell.bookImage.image = booksCollection[indexPath.row].picture
        return cell
    }

}
extension BooksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nibs = Bundle.main.loadNibNamed("DetailBookViewController", owner: nil, options: nil),
            let detailBookVC = nibs[0] as? DetailBookViewController else {
                fatalError()
        }
        detailBookVC.book = booksCollection[indexPath.row]
        present(detailBookVC, animated: true, completion: nil)
    }
}
// 1) Сделать аналог с магазинами -> completion использовать на получение самих магазинов
// 2) Pull to refresh
