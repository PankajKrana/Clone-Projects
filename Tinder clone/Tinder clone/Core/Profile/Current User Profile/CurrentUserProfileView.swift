//
//  CurrentUserProfileView.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 4/9/25.
//

import SwiftUI

struct CurrentUserProfileView: View {
    let user: User
    var body: some View {
        NavigationStack {
            List {
                // header view
                CurrentUserProfileHeaderView(user: user)
                
                
                // info view
                Section("Account Information"){
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text(user.fullName)
                    }
                    
                    HStack {
                        Text("Email")
                        
                        Spacer()
                        
                        Text("test@gmail.com")
                    }
                }
                // legal
                Section("Legal") {
                    Text("Terms of service")
                }
                
                
                // logout/ delete
                
                Section{
                    Button("Logout") {
                        print("DEBUG: Logout here ....")
                    }
                }
                .foregroundStyle(.red)
                
                Section {
                    Button("Delete") {
                        print("DEBUG: Delete here ....")
                    }
                }
                .foregroundStyle(.red)
                
            }
        }
        
    }
}

#Preview {
    CurrentUserProfileView(user: MockData.users[1])
}
