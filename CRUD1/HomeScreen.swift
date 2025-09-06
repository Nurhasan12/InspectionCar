//
//  HomeScreen.swift
//  CRUD1
//
//  Created by Mac on 06/09/25.
//

import SwiftUI

struct InspectionStep: Identifiable {
    let id = UUID()
    let number: Int
    let title: String
    let description: String
}

struct WelcomeView : View {
    @State private var showModal = false
    @State private var showModalAddInspection = false
    
    var body : some View {
        VStack(spacing: 70) {
            Text("Selamat Datang")
                .font(.system(size: 14, weight: .semibold))
                .foregroundColor(.blue)
                .padding(.horizontal, 20)
                .padding(.vertical, 8)
                .background(Color.blue.opacity(0.3))
                .cornerRadius(20)
            
            ZStack {
                Circle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 150, height: 150)
                
                Image(systemName: "wrench.and.screwdriver.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80)
                    .foregroundColor(.blue)
            }
            
            VStack (spacing: 4) {
            Text("MOBE")
                .font(.system(size: 38, weight: .bold))
            
                Text("Inspeksi Mobil Cerdas")
                    .font(.system(size: 16, weight: .semibold))
                
                Text("Dapatkan laporan kondisi mobil incaran anda")
                    .font(.system(size:14))
                    .foregroundColor(.gray)
            }
            
            VStack (spacing: 20) {
                Button(action: {
                    showModalAddInspection.toggle()
                }) {
                    Text("Siap Memulai!")
                        .font(.system(size:16, weight: .bold))
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(15)
                }
                .padding(.horizontal, 30)
                .sheet(isPresented: $showModalAddInspection) {
                    ModalAddInspectionView()
                }
                
//                Button Modal
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("Pelajari Selengkapnya ...")
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(.green)
                }
                .padding(.horizontal, 30)
                .sheet(isPresented: $showModal) {
                    ModalStepView()
                }
            }
        }
        .padding()
    }
}

struct ModalAddInspectionView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var carName: String = ""
    @State private var year: String = "2024"        // Tahun Mobil (sementara String, bisa diubah ke Int)
    @State private var kilometer: String = ""       // Kilometer mobil
    @State private var location: String = ""        // Lokasi inspeksi
    @State private var notes: String = ""           // Catatan tambahan
    @State private var selectedImage: UIImage?      // Foto yang dipilih
    @State private var showImagePicker = false      // Toggle untuk membuka Image Picker
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "car.fill")
                            .foregroundColor(.gray)
                        TextField("Nama Mobil", text: $carName)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    Divider()
                    
                    // TANGGAL
                    HStack {
                        Image(systemName: "calendar")
                            .foregroundColor(.gray)
                        Text(year)
                            .font(.system(size: 16, weight: .semibold))
                        Spacer()
                        Button(action: {
                            
                        }) {
                            Image(systemName: "calendar.badge.plus")
                                .foregroundColor(.blue)
                        }
                    }
                    Divider()
                    
                    // KILOMETER
                    HStack {
                        Image(systemName: "gauge")
                            .foregroundColor(.gray)
                        TextField("Kilometer", text: $kilometer)
                            .keyboardType(.numberPad)
                    }
                    Divider()
                    
                    // INPUT LOKASI
                    HStack(alignment: .top) {
                        Image(systemName: "mappin.and.elilipse")
                            .foregroundColor(.gray)
                        TextField("Lokasi Inspeksi", text: $location)
                    }
                    
                    // CATATAN TAMBAHAN
                    TextEditor(text: $notes)
                        .frame(height: 80)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                        )
                    
                    // UPLOAD FOTO
                    VStack(alignment: .leading, spacing: 8) {
                        HStack{
                            Image(systemName: "camera.fill")
                                .foregroundColor(.gray)
                            Text("Upload Foto")
                                .foregroundColor(.gray)
                        }
                        
                        Button(action: {
                            showImagePicker = true
                        }) {
                            HStack {
                                Image(systemName: "square.and.arroe.up")
                                Text("Upload")
                            }
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue.opacity(0.2))
                            .cornerRadius(12)
                        }
                        
                        if let selectedImage = selectedImage {
                            Image(uiImage: selectedImage)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 150)
                                .cornerRadius(12)
                        }
                    }
                    
                    // FOR SAVE
                    Button(action: {
                        print("add new Inspection: \(carName), \(kilometer), \(location), \(notes)")
                    }) {
                        Text("Add")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(12)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
            .navigationBarTitle("2025-08-25", displayMode: .inline)
            .navigationBarItems(leading: Button("Batal") {
                dismiss()
            })
            .sheet(isPresented: $showImagePicker) {
//                ImagePicker(image: $selectedImage)
            }
        }
    }
}


//View Modal step
struct ModalStepView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var showModalAddInspection = false

    
    
    let steps: [InspectionStep] = [
        InspectionStep(number: 1, title: "Tambah Inspeksi Baru", description: "Tekan tombol di atas untuk memulai inspeksi mobil"),
        InspectionStep(number: 2, title: "Isikan Info Mobil", description: "Masukkan detail mobil seperti merk, model, tahun, dan informasi lainnya"),
        InspectionStep(number: 3, title: "Inspeksi Berhasil Ditambahkan", description: "Data mobil tersimpan dan siap untuk proses inspeksi"),
        InspectionStep(number: 4, title: "Lakukan Inspeksi", description: "Periksa kondisi mobil sesuai dengan checklist yang disediakan"),
        InspectionStep(number: 5, title: "Lihat Report", description: "Dapatkan laporan lengkap dengan persentase kelayakan mobil")
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Cara Kerja Inspeksi")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("Ikuti langkah inspeksi di bawah ini")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 20) {
                    ForEach(steps) { step in
                        HStack(alignment: .top, spacing: 12) {
                            Circle()
                                .fill(Color.blue)
                                .frame(width:28, height: 28)
                                .overlay(
                                    Text("\(step.number)")
                                        .font(.subheadline)
                                        .foregroundColor(.white)
                                )
                            
                            VStack(alignment: .leading, spacing: 4) {
                                Text(step.title)
                                    .font(.headline)
                                Text(step.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                                    .multilineTextAlignment(.leading)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }}
                    .padding()
                    .frame(alignment: .leading)
                    .background(Color(.systemGray6))
                    .cornerRadius(12)
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .padding()
        
        Button(action: {
            showModalAddInspection.toggle()
        }) {
            VStack {
                Circle()
                    .fill(Color.blue)
                    .frame(width:60, height: 50)
                    .overlay (
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    )
                Text("Mulai Inspeksi")
                }
            .sheet(isPresented: $showModalAddInspection) {
                ModalAddInspectionView()
            }
        }
    }
}



#Preview {
//    ModalAddInspectionView()
    WelcomeView()
}
