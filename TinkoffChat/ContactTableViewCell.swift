//
//  ContactTableViewCell.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 28.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell, ConversationCellConfiguration {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    private var _name: String? = nil
    private var _message: String? = nil
    private var _date: Date? = nil
    private var _online: Bool? = nil
    private var _hasUnreadMessages = false
    
    var name: String? {
        get {
            guard let name = _name else {return nil}
            return name
        }
        set (nameValue) {
            _name = nameValue
            self.nameLabel.text = nameValue
        }
    }
    var message: String? {
        get {
            guard let message = _message else {return nil}
            return message
        }
        set (messageValue) {
            guard let message = messageValue else {
                messageLabel.text = "No messages yet"
                return
            }
            _message = message
            messageLabel.text = message
        }
    }
    var date: Date? {
        get {
            guard let date = _date else {return nil}
            return date
        }
        set(dateValue) {
            guard let date = dateValue else {
                dateLabel.text = ""
                return
            }
            _date = date
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            let numOfDays = currentDate.daysBetweenDate(toDate: date)
            
            if abs(numOfDays) > 0 {
                dateFormatter.dateFormat = "dd MMM"
            } else {
                dateFormatter.dateFormat = "HH:mm"
            }
             dateLabel.text = dateFormatter.string(from: date)
        }
    }
    var online: Bool? {
        get {
            guard let online = _online else {return nil}
            return online
        }
        set (isOnline) {
            _online = isOnline
            if isOnline! {
                self.contentView.backgroundColor = UIColor.yellow
            } else {
                self.contentView.backgroundColor = UIColor.clear
            }
        }
    }
    var hasUnreadMessages: Bool {
        get {
            return _hasUnreadMessages
        }
        
        set (hasUnreadMessagesVal){
            _hasUnreadMessages = hasUnreadMessagesVal
            if _hasUnreadMessages {
                messageLabel.font = UIFont.boldSystemFont(ofSize: 13)
            } else {
                messageLabel.font = UIFont.systemFont(ofSize: 13)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

protocol ConversationCellConfiguration: class {
    var name: String? {get set}
    var message: String? {get set}
    var date: Date? {get set}
    var online: Bool? {get set}
    var hasUnreadMessages: Bool {get set}
}

extension Date {
    func daysBetweenDate(toDate: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: self, to: toDate)
        return components.day ?? 0
    }
}
