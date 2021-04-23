//
//  ContentView.swift
//  CarouselSlider
//
//  Created by Sheikh Bayazid on 4/23/21.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = Trip.example[2]
    @State private var trips: [Trip] = Trip.example
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                
                let frame = geo.frame(in: .global)
                
                Image(selectedTab.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
            }
            .ignoresSafeArea()
            
            // MARK: - Custom Carousel
            VStack {
                Text("Welcome!")
                    .fontWeight(.medium)
                    .foregroundColor(.black)
                
                Text("highonswiftui")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding(.bottom, 40)
                
                // MARK: - Carousel
                VStack {
                    GeometryReader { geo in
                        let frame = geo.frame(in: .global)
                        
                        TabView(selection: $selectedTab) {
                            ForEach(trips) { trip in
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: frame.width - 10, height: frame.height)
                                    .cornerRadius(5)
                                    .tag(trip)
                            }
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        
                    }.frame(height: UIScreen.main.bounds.size.height / 2.2)
                    
                    Text(selectedTab.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.top, 20)
                        //.padding(.bottom)
                    
                    // MARK: - PageControl using UIKit
                    PageControlView(currentPage: getCurrentPageIndex(), numberOfPages: trips.count).padding(.vertical, 10)
                    
                }.padding(.top)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .background(Color.white.cornerRadius(10))
                .padding(.horizontal, 20)
                
                Button(action: {}, label: {
                    Text("GET STARTED")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 18)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }).padding(.top, 30)
                .padding(.horizontal)
            }.padding()
        }
    }
    
    func getCurrentPageIndex() -> Int {
        let index = trips.firstIndex { (trip) -> Bool in
            return selectedTab.id == trip.id
        } ?? 0
        
        return index
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
