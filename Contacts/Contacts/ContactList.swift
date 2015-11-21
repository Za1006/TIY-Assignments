//
//  ContactList.swift
//  Contacts
//
//  Created by Elizabeth Yeh on 11/20/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import RealmSwift

class Person: Object
{
    dynamic var name = ""
    dynamic var phoneNumber = ""
    dynamic var birthday = ""
//    dynamic var city = ""
//    dynamic var zipcode = ""
    
    let contacts = List<Person>()
//    let family = List<Person>()
//    let friends = List<Person>()
    
}
