//
//  ResultView.swift
//  CRUD1
//
//  Created by Mac on 09/09/25.
//

import SwiftUI
import CoreData

struct ResultView: View {
    var body : some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Laporan Hasil Inspeksi")
                        .font(.headline)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        
                        HStack {
                            Image("car_set")
                                .resizable()
                                .frame(width: 60, height: 60)
                                .clipShape(Circle())
                                .shadow(radius: 5)
                            
                            VStack(alignment: .leading) {
                                Text("Toyota Camry Hybrid")
                                    .font(.headline)
                                    .padding(2)
                                Text("2022")
                                    .font(.caption)
                                    .padding(2)
                            }
                            Spacer()
                        }
                        
                        HStack {
                            Image(systemName: "gauge.with.dots.needle.67percent")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.gray)
                            Text("47,889 KM")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                            
                            Spacer()
                            
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 15, height: 15)
                                .foregroundStyle(.gray)
                            Text("03/09/2025")
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        .padding(.horizontal, 5)
                        
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Skor Keseluruhan")
                                    .font(.headline)
                                Text("Kondisi umum Kendaraan")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                                
                                HStack {
                                    VStack {
                                        Text("1")
                                            .font(.title)
                                            .foregroundStyle(.red)
                                        Text("Kritis")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                    }
                                    
                                    VStack {
                                        Text("2")
                                            .font(.title)
                                            .foregroundStyle(.yellow)
                                        Text("Perhatian")
                                            .font(.subheadline)
                                            .foregroundStyle(.gray)
                                    }
                                    .padding()
                                }
                            }
                            Spacer()
                            Text("100%")
                                .font(.title)
                                .foregroundStyle(.green)
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 10)
                    }
                    .padding()
                    .background(
                        LinearGradient(
                            colors: [
                                Color(red: 0.25, green: 0.5, blue: 1.0),   // Biru cerah, mirip warna link iOS
                                Color(red: 0.1, green: 0.2, blue: 0.7)     // Biru tua yang lembut
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    
                    VStack {
                        HStack {
                            Image(systemName: "eye")
                                .resizable()
                                .frame(width: 15, height: 10)
                            Text("Interior")
                                .fontWeight(.bold)
                            Spacer()
                            Text("8/10")
                                .fontWeight(.bold)
                        }
                        .padding(5)
                        .background(Color.gray)
                        .cornerRadius(10)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Jok Mobil")
                                    .font(.subheadline)
                                HStack {
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .resizable()
                                        .frame(width: 10, height: 10)
                                    Text("Ini eror")
                                        .font(.caption2)
                                        .foregroundStyle(.red)
                                }
                                
                            }
                            Spacer()
                            HStack {
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 10, height: 10)
                                Text("baik")
                                    .font(.subheadline)
                            }
                            .padding(4)
                            .background(Color.green)
                            .cornerRadius(35)
                        }
                    }
                    .padding(.horizontal, 10)
                    .background(Color.blue.opacity(0.1))
                }
                .padding()
            }
        }
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView()
    }
}
