//
//  Interlocutor.swift
//  TinkoffChat
//
//  Created by Павел Мартыненков on 28.03.17.
//  Copyright © 2017 Павел Мартыненков. All rights reserved.
//

import Foundation

class Interlocutor {
    
    var name: String!
    var messages: Array<Message?> = Array()
    var isOnline: Bool!
    
    func addNewMessage(messageText: String) {
        let newMessage = Message()
        
        newMessage.message = messageText
        newMessage.date = Date()
        newMessage.isRead = false
        newMessage.isTo = true
        
        messages.append(newMessage)
    }
    
}
