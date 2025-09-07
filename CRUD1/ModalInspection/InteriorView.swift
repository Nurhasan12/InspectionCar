//
//  InteriorView.swift
//  CRUD1
//
//  Created by Mac on 07/09/25.
//

import SwiftUI

struct InteriorView: View {
    // Dummy data untuk demo
    let items: [SubItem] = [
        SubItem(
            title: "Jok & Kursi",
            description: """
            Scan seluruh permukaan jok untuk noda, sobekan, atau kerusakan.
            Perhatikan jahitan yang longgar atau bahan yang mulai mengelupas.
            Cek konsistensi warna.
            """,
            imageName: "car_set"   // pastikan ada di Assets.xcassets
        ),
        SubItem(
            title: "Dashboard",
            description: "Periksa kondisi dashboard dari retakan atau kerusakan.",
            imageName: "car_set"
        ),
        SubItem(
            title: "Setir Mobil",
            description: "Periksa kondisi setir, kelonggaran, dan keausan.",
            imageName: "car_set"
        ),
        SubItem(
            title: "Karpet & Lantai",
            description: "Periksa kondisi karpet dan lantai mobil.",
            imageName: "car_set"
        ),
        SubItem(title: "Atap",
                description: "Periksa Dengan Teliti",
                imageName: "car_set")
    ]
    
    var body: some View {
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(items) { item in
                            SubAccordionView(subItem: item)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .navigationTitle("Interior")
                .navigationBarTitleDisplayMode(.inline) // optional, biar judulnya nggak gede
            }
        }
}

#Preview {
    InteriorView()
}
