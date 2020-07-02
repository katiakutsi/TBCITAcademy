//
//  ViewController.swift
//  task 31
//
//  Created by katia kutsi on 6/1/20.
//  Copyright © 2020 TBC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var sandro: Person?
        var developer: Job?
        
        sandro = Person()
        developer = Job()
        
        sandro?.job = developer
        developer?.person = sandro
        
        sandro = nil
        developer = nil
    }
    
}

class Job {
    weak var person: Person?
    
    deinit {
        print("Deallocating Job")
    }
}
 
class Person {
    var job: Job?
    
    deinit {
        print("Deallocating Person")
    }
}
/*
 memory leak მოგვარდა weak keyword-ის გამოყენების საშუალებით. ვფიქრობ , რომ შეიძლება
 არსებობდეს person რომელსაც არ აქვს job და ასევე შეიძლება არსებობდეს სადმე job რომელსაც არ
 ჰყავს person , ამიტომ არ ვნიშნავ unowned .
 ვფიქრობ არ არის აუცილებელი person-ის და job-ის ორივეს weak-ად მონიშვნა, ერთიც საკმარისია.
 ჩემი აზრით, arc იქცევა შემდეგნაირად:
 რადგან job-ის person არი weak მარტო, მაშინ  Person() ობიექტს აღარ დაუთვლის მიმთითებლებს და
 წაშლის და მერე რადგან ეს Person() წაშალა ამ person()-ს ერთ-ერთი მიმთითებლით ხო ვიყენებდით
 რომ job() ობიექტზე მეორე მიმთითებელი გაგვეკეთებინა და რახან person წაიშალა შესაბამისად ისიც
 წაშალა იმიტორო არარსებულ ობიექტზე .job-ს ვერ გამოვიძახებდით და job()ზე მეორე მიმთითებელს
 ვერ გავაკეთებდით ანუ job()-ს ერთი მიმთითებელი დარჩებოდა და ის ერთი მიმთითებელი developer =
 nil - ით წაიშლებოდა
 */
