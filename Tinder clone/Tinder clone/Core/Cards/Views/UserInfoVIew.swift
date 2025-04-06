//
//  UserInfoVIew.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/21/25.
//

import SwiftUI

struct UserInfoVIew: View {
    @Binding var showProfileModel: Bool
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(user.fullName)
                    .font(.title)
                    .fontWeight(.heavy)
                
                Text("\(user.age)")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    showProfileModel.toggle()
                } label: {
                    Image(systemName: "arrow.up.circle")
                        .fontWeight(.bold)
                        .imageScale(.large)
                }
            }
            Text("Some text Bio ...")
                .font(.subheadline)
                .lineLimit(2)
        }
        .foregroundStyle(.white)
        .padding()
        .background(
            LinearGradient(
                colors: [.clear, .black],
                startPoint: .top,
                endPoint: .bottom
            )
        )
    }
}

#Preview {
    UserInfoVIew(showProfileModel: .constant(false), user: MockData.users[0])
}
