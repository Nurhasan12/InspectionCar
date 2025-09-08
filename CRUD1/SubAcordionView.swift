//
//  SubAcordionView.swift
//  CRUD1
//
//  Created by Mac on 07/09/25.
//

import SwiftUI

struct SubAccordionView: View {
    let subItem: SubItem
    @State private var isExpanded = false     // State untuk buka/tutup accordion
    @State private var notes: String = ""     // State untuk catatan user
    
    @State private var selectedOption: String? = nil
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            
            // Konten detail muncul ketika accordion dibuka
            VStack(alignment: .leading, spacing: 12) {
                
                // Gambar inspeksi
                Image(subItem.imageName)
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(8)
                
                // Deskripsi inspeksi
                HStack (alignment: .top) {
                    Image(systemName: "exclamationmark.circle")
                    Text(subItem.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                
                // Tombol pilihan (Bersih, Noda, Sobek)
                HStack(spacing: 32) {
                    Button(action: {
                        print("Bersih Tapped")
                        selectedOption = "Bersih"
                    }) {
                        VStack {
                            Image(systemName: "hand.thumbsup.fill")
                                .font(.title2)
                                .foregroundColor(.green)
                            Text("Bersih").font(.caption)
                        }
                        .padding()
                        .frame(width: 80, height: 80)
                        .background(
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(selectedOption == "Bersih" ? Color.green.opacity(0.3) : Color.clear)
                        )
                        
                    }
                    
                    Button(action: {
                        print("Noda Tapped")
                        selectedOption = "Noda"
                    }) {
                        VStack {
                            Image(systemName: "exclamationmark.circle.fill")
                                .font(.title2)
                                .foregroundColor(.yellow)
                            Text("Noda").font(.caption)
                        }
                        .padding()
                        .frame(width: 80, height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedOption == "Noda" ? Color.yellow.opacity(0.3) : Color.clear)
                        )
                    }
                    Button(action: {
                        print("Sobek tapped")
                        selectedOption = "Sobek"
                    }) {
                        VStack {
                            Image(systemName: "hand.thumbsdown.fill")
                                .font(.title2)
                                .foregroundColor(.red)
                            Text("Sobek").font(.caption)
                        }
                        .padding()
                        .frame(width: 80, height: 80)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(selectedOption == "Sobek" ? Color.red.opacity(0.3) : Color.clear)
                        )
                    }
                }
                .padding()
                
                // Catatan tambahan
                TextField("✏️ Tambahkan Catatan", text: $notes)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.top, 8)
            }
            .padding(.top, 8)
            
        } label: {
            // Judul accordion
            Text(subItem.title)
                .font(.headline)
                .bold()
                .foregroundColor(.blue)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
        .shadow(radius: 1)
    }
}

// MARK: - Preview
struct SubAccordionView_Previews: PreviewProvider {
    static var previews: some View {
        SubAccordionView(
            subItem: SubItem(
                title: "Jok & Kursi",
                description: """
                Scan seluruh permukaan jok untuk noda, sobekan, atau kerusakan.
                Perhatikan jahitan yang longgar atau bahan yang mulai mengelupas.
                Cek konsistensi warna - apakah ada fading atau diskolorasi.
                Style matters: Interior yang terawat mencerminkan perawatan keseluruhan mobil.
                """,
                imageName: "car_set" // pastikan ada di Assets.xcassets
            )
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}

