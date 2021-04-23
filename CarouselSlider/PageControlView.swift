//
//  PageControlView.swift
//  CarouselSlider
//
//  Created by Sheikh Bayazid on 4/23/21.
//

import SwiftUI

struct PageControlView: UIViewRepresentable {
    let currentPage: Int
    let numberOfPages: Int
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.backgroundStyle = .prominent
        control.numberOfPages = numberOfPages
        control.currentPage = currentPage
        return control
    }
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
}

struct PageControlView_Previews: PreviewProvider {
    static var previews: some View {
        PageControlView(currentPage: 1, numberOfPages: 4)
    }
}
