//
//  ExploreViewModel.swift
//  Eagle
//
//  Created by Dalveer singh on 21/06/22.
//

import Foundation
class ExploreViewModel:ObservableObject{
    @Published var users = [User]()
    @Published var searchText=""
    var searchableUsers:[User]{
        if searchText.isEmpty{
            return users
        }
        else{
            let lowercaseQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercaseQuery) ||
                $0.fullname.lowercased().contains(lowercaseQuery)
            })
        }
    }
    let service =  UserService()
    init(){
        fetchUsers()
    }
    func fetchUsers(){
        service.fetchUsers { users in
            self.users = users
        }
    }
}
