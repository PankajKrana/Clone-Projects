//
//  CardView.swift
//  Tinder clone
//
//  Created by Pankaj Kumar Rana on 3/21/25.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel: CardViewModel
    @State private var xOffset: CGFloat = 0
    @State private var degree: Double = 0
    @State private var currentImageIndex = 0
    @State private var showProfileModel = false
    
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)

                    .overlay {
                        ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: imageCount )
                    }
                CardImageIndicatorView(currentImageIndex: 0, imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffset: $xOffset)
            }
                            
            UserInfoVIew(showProfileModel: $showProfileModel, user: user)
            
        }
        .fullScreenCover(isPresented: $showProfileModel) {
            UserProfileView(user: user)
        }
        .onReceive(viewModel.$buttonSwipeAction, perform: { action in
            onReciveSwipeAction(action)
        })
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .offset(x: xOffset)
        .rotationEffect(.degrees(degree))
        .animation(.snappy, value: xOffset)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )

    }
}

private extension CardView {
    var user: User {
        return model.user
    }
    var imageCount : Int {
        return user.profileImageURLs.count
    }
}
private extension CardView {
    func returnToCenter() {
        xOffset = 0
        degree = 0
    }
    
    func swipeRight() {
        withAnimation {
            xOffset = 500
            degree = 12
        } completion: {
            viewModel.removeCard(model)
        }

    }
    
    func swipeLeft() {
        withAnimation {
            xOffset = -500
            degree = -12
        } completion: {
            viewModel.removeCard(model)

        }
    }
    
    func onReciveSwipeAction ( _ action: SwipeAction?) {
        guard let action else { return }
        
        let topCard = viewModel.cardModels.last
        
        if topCard == model {
            switch action {
            case .reject:
                swipeLeft()
            case .like:
                swipeRight()
            }
        }
    }
}

private extension CardView {
    
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffset = value.translation.width
        degree = Double(value.translation.width / 25)

    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) < abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return 
        }
        
        if width >= SizeConstants.screenCutoff {
            swipeRight()
        } else {
            swipeLeft()
        }
    }
}


#Preview {
    CardView(
        viewModel: CardViewModel(
            service: CardService()),
        model: CardModel(user: MockData.users[0])
    )
}
