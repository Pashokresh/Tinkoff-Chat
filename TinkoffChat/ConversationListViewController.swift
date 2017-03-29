//
//  ConversationListViewController.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 27.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import UIKit

class ConversationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var contactsList: Array<Interlocutor> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Tinkoff chat"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 11
        } else {
            return 11
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactTableViewCell
        
        cell.date = Date(timeIntervalSinceNow: -(Double(arc4random_uniform(5000000))))
        cell.online = indexPath.section == 0 ? true : false
        
        
        
        if indexPath.section == 0  {
            cell.name = indexPath.row % 2 == 0 ? "Пользователь" : "Собеседник"
            cell.hasUnreadMessages = indexPath.row % 3 == 2 ? true : false
            cell.message = indexPath.row % 4 > 1 ? "Привет, как дела?" : nil
        } else {
            cell.nameLabel.text = indexPath.row % 2 == 1 ? "Пользователь" : "Собеседник"
            cell.hasUnreadMessages = indexPath.row % 3 == 1 ? true : false
            cell.message = indexPath.row % 5 > 1 ? "До встречи!": nil
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Online"
        } else if section == 1 {
            return "History"
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "FromConversationListToConversation" {
            if let destination = segue.destination as? ConversationViewController {
                if let cell = sender as? ContactTableViewCell {
                    
                    destination.title = cell.name
                }
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
