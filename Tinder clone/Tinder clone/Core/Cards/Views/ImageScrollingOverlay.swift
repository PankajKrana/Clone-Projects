//
//  ImageScrollingOverlay.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/23/25.
//

import SwiftUI

struct ImageScrollingOverlay: View {
    @Binding var currentImageIndex: Int
    
    let imageCount  : Int
    
    var body: some View {
        HStack {
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: false)
                }
            
            Rectangle()
                .onTapGesture {
                    updateImageIndex(increment: true)
                }
        }
        .foregroundStyle(.white.opacity(0.1))
        
    }
}

private extension ImageScrollingOverlay {
    func updateImageIndex(increment: Bool) {
        if increment {
            guard currentImageIndex  < imageCount - 1 else { return }
            currentImageIndex += 1
        } else {
            guard currentImageIndex > 0 else { return }
            currentImageIndex -= 1
        }
    }
    
}

#Preview {
    ImageScrollingOverlay(currentImageIndex: .constant(1), imageCount: 7)
}
