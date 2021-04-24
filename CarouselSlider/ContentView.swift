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
                
                // MARK: - Current Image
                Image(selectedTab.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: frame.width, height: frame.height)
                    .cornerRadius(0)
            }
            .ignoresSafeArea()
            
            // MARK: - Header
            VStack {
                VStack {
                    Text("Welcome!")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    Text("highonswiftui")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
                .offset(y: -50)
                
                // MARK: - Carousel
                VStack {
                    GeometryReader { geo in
                        let frame = geo.frame(in: .global)
                        
                        // MARK: - Images
                        TabView(selection: $selectedTab) {
                            ForEach(trips) { trip in
                                Image(trip.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(5)
                                    .frame(width: frame.width - 10, height: frame.height)
                                    .tag(trip)
                            }
                        }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        
                    }.frame(height: UIScreen.main.bounds.size.height / 3.5)
                    //.background(Color.gray)
                    
                    // MARK: - PageControl using UIKit
                    PageControlView(currentPage: getCurrentPageIndex(), numberOfPages: trips.count).padding(.vertical, 10)
                        .offset(y: -20)
                    
                    Text(selectedTab.title)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding(.bottom)
                    
                }.padding(.top)
                .padding(.horizontal, 10)
                .padding(.bottom, 5)
                .background(Color.white.cornerRadius(10))
                .padding(.horizontal, 20)
                
                // MARK: - GET STARTED BUTTON
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
    
    // MARK: - Get Current Index of the page
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
