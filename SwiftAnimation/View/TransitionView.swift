//
//  TransitionView.swift
//  SwiftAnimation
//
//  Created by User on 22/04/24.
//

import SwiftUI

struct TransitionView: View {
    @State private var show = false
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundStyle(.green)
                .overlay{
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                }
            
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundStyle(.purple)
                //                    .transition(.scale(scale: 0, anchor: .bottom))
                    .transition(.offsetScaleOpacity)
                    .overlay{
                        Text("Well, it goes like this!")
                            .font(.system(.largeTitle, design: .rounded))
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                    }
                
            } else {
                /*@START_MENU_TOKEN@*/EmptyView()/*@END_MENU_TOKEN@*/
            }
        }
        .onTapGesture {
            withAnimation(.bouncy(duration: 1)){
                show.toggle()
            }
        }
    }
}

#Preview {
    TransitionView()
}

// MARK: - extention

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        // MARK: - symmetric
        // AnyTransition.offset(x: -600, y:0).combined(with: .scale).combined(with: .opacity)
        
        // MARK: - asymmetric
        
        AnyTransition.asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y:0))
    }
}

