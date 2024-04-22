//
//  StarView.swift
//  SwiftAnimation
//
//  Created by User on 22/04/24.
//

import SwiftUI

struct StarView: View {
    @State private var showStar = false
    @State private var isLoading = false
    
    var body: some View {
        VStack{
            Image(systemName: "star.fill")
                .font(.system(size: 100))
            if showStar{
                Text("5.0 ⭐️")
                    .padding()
            }
            
            HStack{
                ForEach(0...4, id: \.self){ item in 
                    Circle()
                        .frame(width: 10, height: 10)
                        .foregroundStyle(isLoading ? .gray.opacity(0.5) : .green)
                        .scaleEffect(isLoading ? 0.5 : 1)
                        .animation(.linear(duration: 0.5).repeatForever().delay(0.2*Double(item)), value: isLoading)
                }
            }
            .onAppear{
                isLoading.toggle()
            }
        }
        .onTapGesture {
            withAnimation(.bouncy){
                showStar.toggle()
            }
        }
    }
}

#Preview {
    StarView()
}

