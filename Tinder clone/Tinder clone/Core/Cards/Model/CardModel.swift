//
//  CardModel.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/24/25.
//

import Foundation

struct CardModel {
    let user : User
}


extension CardModel: Identifiable, Hashable {
    var id: String { return user.id}
}
