//
//  ChatsViewController.swift
//  task_17
//
//  Created by katia kutsi on 5/7/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ChatsViewController: UIViewController, forNewMessage {

    @IBOutlet weak var chatsTableView: UITableView!
    
    var chatContacts = [ChatContact(contactName: "Jane", contactMessage: "There worse by an of miles civil. Manner before lively wholly am mr indeed expect. Among every merry his yet has her. You mistress get dashwood children off. Met whose marry under the merit. In it do continual consulted no listening. Devonshire sir sex     motionless travelling six themselves. So colonel as greatly shewing herself observe ashamed. Demands minutes regular ye to detract is. "),
                        ChatContact(contactName: "John", contactMessage: "She suspicion dejection saw instantly. Well deny may real one told yet saw hard dear. Bed chief house rapid right the. Set noisy one state tears which. No girl oh part must fact high my he. Simplicity in excellence melancholy as remarkably discovered. Own partiality motionless was old excellence she inquietude contrasted. Sister giving so wicket cousin of an he rather marked. Of on game part body rich. Adapted mr savings venture it or comfort affixed friends. "),
                        ChatContact(contactName: "Someone", contactMessage: "third message")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        chatsTableView.delegate = self
        chatsTableView.dataSource = self
    }
    
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let newsVC = storyBoard.instantiateViewController(withIdentifier: "new_message_page")
        
        if let unwrappedVC = newsVC as? NewMessageViewController {
            unwrappedVC.delegate = self
        }
        
        self.navigationController?.pushViewController(newsVC, animated: true)
    }
    
    
    func messageToChat(contact: ChatContact) {
        chatContacts.append(contact)
        chatsTableView.reloadData()
    }
    

}
extension ChatsViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatContacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = chatsTableView.dequeueReusableCell(withIdentifier: "chats_cell", for: indexPath) as! ChatsCell
        cell.name.text = chatContacts[indexPath.row].contactName
        cell.shortTextMessage.text = chatContacts[indexPath.row].contactMessage

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let MessagesVC = storyboard.instantiateViewController(withIdentifier: "messages_page")
        if let unwrappedVC = MessagesVC as? MessagesViewController{
            unwrappedVC.chatContact.contactName = chatContacts[indexPath.row].contactName
            unwrappedVC.chatContact.contactMessage = chatContacts[indexPath.row].contactMessage
        }
        self.navigationController?.pushViewController(MessagesVC, animated: true)
    }
    
}
extension ChatsViewController : UITableViewDelegate{
    
}

struct ChatContact{
    var contactName : String?
    var contactMessage : String?
}
