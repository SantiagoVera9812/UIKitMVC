//
//  DetailView.swift
//  DemoUI
//
//  Created by Angel Kenyi Rodriguez Vergara on 24/10/24.
//

import UIKit
import SwiftUI

class DetailView: UIView {
    
    lazy var lblTitle = HeaderLabel(title: "SOY UN TÍTULO")
    lazy var imgMovie = ImageCustom()
    lazy var imgMovie2 = ImageCustom()
    lazy var txtEmail = EmailTextField { newValue in
        self.lblTitle.text = newValue
    } returnKeyPressedCallback: {
        print("Presiono tecla return")
    }

    
    lazy var stkContent = VerticalStack(subViews: [self.lblTitle, self.stkImgs, self.txtEmail], spacing: 80)
    lazy var stkImgs = HorizontalStack(subViews: [self.imgMovie, self.imgMovie2], margins: .zero)

    func addElements() {
        self.addSubview(self.stkContent)
        NSLayoutConstraint.activate([
            self.stkContent.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.stkContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stkContent.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
        self.txtEmail.text = self.lblTitle.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct DetailViewSU: View {
    
    @State private var emailText: String = "SOY UN TÍTULO"
    
    var body: some View {
        VStack(spacing: 80) {
            HeaderLabelSU(text: emailText)
            HStack(spacing: 20) {
                ImageCustomSU()
                ImageCustomSU()
            }
            EmailTextFieldSU(text: $emailText)
            Spacer()
        }
        .padding()
        .background(.white)
        .padding(.top, 30)
    }
}

//MARK: - Preview SwiftUI

struct DetailViewRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> DetailView {
        let view = DetailView()
        return view
    }
    
    func updateUIView(_ uiView: DetailView, context: Context) {
        
    }
}

struct DetailViewPreview: PreviewProvider {
    static var previews: some View { DetailViewSU() }
}
