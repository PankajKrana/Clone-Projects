//
//  CurrentUserProfileHeaderview.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 4/9/25.
//

import SwiftUI

struct CurrentUserProfileHeaderView: View {
    let user: User
    var body: some View {
        VStack {
            ZStack(alignment: .topTrailing) {
                Image(user.profileImageURLs[0])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())
                    .background{
                        Circle()
                            .fill(Color(.systemGray6))
                            .frame(width: 128, height: 128)
                            .shadow(radius: 10)
                    }
                
                Image(systemName: "pencil")
                    .imageScale(.small)
                    .foregroundStyle(.gray)
                    .background{
                        Circle()
                            .fill(.white)
                            .frame(width: 32, height: 32)
                            .shadow(radius: 10)
                    }
                    .offset(x: -8, y:10)
            }
            Text("\(user.fullName), \(user.age)")
                .font(.title2)
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity)
        .frame(height: 240)
    }
}

#Preview {
    CurrentUserProfileHeaderView(user: MockData.users[0])
}
