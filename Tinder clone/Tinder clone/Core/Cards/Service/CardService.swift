//
//  CardService.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/24/25.
//

import Foundation


struct CardService {
    func fetchCardModels()  async throws -> [CardModel] {
        let user = MockData.users
        return user.map({ CardModel(user: $0)})
    }
}
