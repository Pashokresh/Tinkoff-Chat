//
//  ConversationViewController.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 28.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 60

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MessageTableViewCell
        
        if indexPath.row < 3 {
            cell = tableView.dequeueReusableCell(withIdentifier: "To") as! MessageTableViewCell
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: "From") as! MessageTableViewCell
        }
        cell.messageLabel.preferredMaxLayoutWidth = 3 * self.view.bounds.size.width / 4
        
        if (indexPath.row) % 3 == 0 {
        cell.messageText = "Лучше обговорить все в скайпе."
        }
        
        if indexPath.row % 3 == 1 {
            cell.messageText = "Кот"
        }
        
        if indexPath.row % 3 == 2 {
            cell.messageText = "Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе.Лучше обговорить все в скайпе."
        }
        
        return cell
    }

}
