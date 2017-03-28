//
//  MessageTableViewCell.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 28.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import UIKit

protocol MessageCellConfiguration: class {
    var messageText: String? {get set}
}

class MessageTableViewCell: UITableViewCell, MessageCellConfiguration {
    
    @IBOutlet weak var messageLabel: UILabel!
    
    private var _messageText: String?
    
    var messageText: String? {
        get {
            guard let messageText = _messageText else {
                return ""
            }
            return messageText
        }
        set (messageTextValue) {
            guard let messageText = messageTextValue else {
                return
            }
            _messageText = messageText
            messageLabel.text = messageText
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
