//
//  MockData.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/24/25.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Megan Fox",
            age: 38,
            profileImageURLs: ["meganFox1", "meganFox2", "meganFox3"]
        ),
            .init(
                id: NSUUID().uuidString,
                fullName: "Amber Moore",
                age: 28,
                profileImageURLs: ["amber1", "amber2", "amber3"]
            ),
        
        .init(
            id: NSUUID().uuidString,
            fullName: "Mia",
            age: 32,
            profileImageURLs: ["mia1", "mia2", "mia3"]
        ),
        
            .init(
                id: NSUUID().uuidString,
                fullName: "Anadearmas",
                age: 30,
                profileImageURLs: ["anadearmas1", "anadearms2", "anadearms3"]
            ),
        
        .init(
            id: NSUUID().uuidString,
            fullName: "Dani",
            age: 38,
            profileImageURLs: ["dani1", "dani2", "dani3"]
        ),
    
    .init(
        id: NSUUID().uuidString,
        fullName: "Elizabeth Olsen",
        age: 36,
        profileImageURLs: ["elizabeth1","elizabeth2", "elizabeth3"]
    ),
        .init(
            id: NSUUID().uuidString,
            fullName: "Casey",
            age: 33,
            profileImageURLs: ["casey1", "casey2", "casey3"]
        )

        

        
        
        
    ]
}
