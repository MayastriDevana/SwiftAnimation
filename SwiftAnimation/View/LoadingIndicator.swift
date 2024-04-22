//
//  LoadingIndicator.swift
//  SwiftAnimation
//
//  Created by User on 22/04/24.
//

import SwiftUI

struct LoadingIndicator: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    
    var body: some View {
        VStack(spacing: 30){
            LoadingProgress()
            
            LoadingWithProgress()
        }
    }
}

#Preview {
    LoadingIndicator()
}

struct LoadingProgress: View {
    @State private var isLoading = false
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.7)
            .stroke(Color.green, lineWidth: 5)
            .frame(width: 100, height: 100)
        
            .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
            .onAppear{
                isLoading = true
            }
    }
}

struct LoadingWithProgress: View {
    @State private var isLoading = false
    @State private var progress: CGFloat = 0.0
    var body: some View {
        ZStack{
            Text("\(progress * 100, specifier: "%.f")%")
            
            Circle()
                .stroke(Color(.systemGray5), lineWidth: 10)
            
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(Color.green, lineWidth: 5)
                .frame(width: 100, height: 100)
            
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: isLoading)
                .onAppear{
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.5, repeats:true) {timer in
                        // progress = progress + 0.5
                        if progress > 1.0 {
                            //                                timer.invalidate()
                            progress = 0.0
                        }else{
                            progress += 0.05
                        }
                        
                    }
                }
            
        }
        .frame(width: 100, height: 100)
    }
}
