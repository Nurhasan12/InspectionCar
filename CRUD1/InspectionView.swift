//
//  InspectionView.swift
//  CRUD1
//
//  Created by Mac on 07/09/25.
//

//import SwiftUI
//
//struct CarInspectionView: View {
//    @State private var showExterior = false
//    
//    var body: some View {
//        VStack(spacing: 30) {
//            VStack(spacing: 10) {
//                Image("car_set")
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width:120, height: 120)
//                    .clipShape(Circle())
//                    .shadow(radius: 5)
//                
//                Text("BMW I5")
//                    .font(.headline)
//                    .fontWeight(.bold)
//                
//                Text("2020")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            
//            VStack(alignment: .leading, spacing: 40) {
//                HStack(spacing: 80) {
////                    button exterior
//                    Button(action: {
//                        print("Exterior tapped")
//                    }) {
//                        VStack {
//                            Image(systemName: "car.fill")
//                                .font(.system(size:30))
//                                .foregroundColor(.cyan)
//                                .padding()
//                                .background(Circle().fill(Color.blue))
//                            Text("Eksterior")
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                            Text("0/10")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    
////                    Interior Button
//                    Button(action: {
//                        print("interior tapped")
//                        showExterior.toggle()
//                    }) {
//                        VStack {
//                            Image(systemName: "steeringwheel")
//                                .font(.system(size: 30))
//                                .foregroundColor(.cyan)
//                                .padding()
//                                .background(Circle().fill(Color.blue))
//                            Text("Interior")
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                            Text("0/8")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                        
//                        .sheet(isPresented: $showExterior) {
//                            InteriorView()
//                        }
//                    }
//                }
//                
//                HStack(spacing: 80 ) {
//                    Button(action:  {
//                        print("Mesin Tapped")
//                    }) {
//                        VStack {
//                            Image(systemName: "gearshape.fill")
//                                .font(.system(size: 30))
//                                .foregroundColor(.cyan)
//                                .padding()
//                                .background(Circle().fill(Color.blue))
//                            Text("Mesin")
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                            Text("0/8")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                    
//                    Button(action: {
//                        print("documend tapped")
//                    }) {
//                        VStack {
//                            Image(systemName: "doc.text.fill")
//                                .font(.system(size: 30))
//                                .foregroundColor(.cyan)
//                                .padding()
//                                .background(Circle().fill(Color.blue))
//                            Text("Dokumen")
//                                .font(.subheadline)
//                                .foregroundColor(.blue)
//                            Text("0/10")
//                                .font(.caption)
//                                .foregroundColor(.gray)
//                        }
//                    }
//                }
//            }
//            .padding(.bottom, 50)
//            
//            Button(action : {
//                print("lihat kondisi tapped")
//            }) {
//                Text("Lihat Report Kondisi Mobil")
//                    .font(.headline)
//                    .foregroundColor(.white)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.blue)
//                    .cornerRadius(12)
//            }
//            .padding(.horizontal, 50)
//        }
//    }
//}
//
//struct CarInspectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarInspectionView()
//    }
//}

import SwiftUI

struct CarInspectionView: View {
    // 👉 Car ini dikirim dari ModalAddInspectionView setelah berhasil save
    var car: Car
    
    @State private var showInterior = false
    
    var body: some View {
        VStack(spacing: 30) {
            VStack(spacing: 10) {
                // --- Foto mobil
                if let fotoData = car.foto,
                   let uiImage = UIImage(data: fotoData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                } else {
                    Image(systemName: "car.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 120, height: 120)
                        .foregroundColor(.gray)
                }
                
                // --- Nama Mobil
                Text(car.namaMobil ?? "Unknown Car")
                    .font(.headline)
                    .fontWeight(.bold)
                
                // --- Tahun Produksi
                Text("\(car.tahunProduksi)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading, spacing: 40) {
                HStack(spacing: 80) {
                    // Exterior button
                    Button(action: {
                        print("Exterior tapped")
                    }) {
                        VStack {
                            Image(systemName: "car.fill")
                                .font(.system(size:30))
                                .foregroundColor(.cyan)
                                .padding()
                                .background(Circle().fill(Color.blue))
                            Text("Eksterior")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("0/10")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Interior button
                    Button(action: {
                        showInterior.toggle()
                    }) {
                        VStack {
                            Image(systemName: "steeringwheel")
                                .font(.system(size: 30))
                                .foregroundColor(.cyan)
                                .padding()
                                .background(Circle().fill(Color.blue))
                            Text("Interior")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("0/8")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    .sheet(isPresented: $showInterior) {
                        InteriorView()
                    }
                }
                
                HStack(spacing: 80 ) {
                    Button(action:  {
                        print("Mesin tapped")
                    }) {
                        VStack {
                            Image(systemName: "gearshape.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.cyan)
                                .padding()
                                .background(Circle().fill(Color.blue))
                            Text("Mesin")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("0/8")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Button(action: {
                        print("Dokumen tapped")
                    }) {
                        VStack {
                            Image(systemName: "doc.text.fill")
                                .font(.system(size: 30))
                                .foregroundColor(.cyan)
                                .padding()
                                .background(Circle().fill(Color.blue))
                            Text("Dokumen")
                                .font(.subheadline)
                                .foregroundColor(.blue)
                            Text("0/10")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .padding(.bottom, 50)
            
            Button(action : {
                print("lihat kondisi tapped")
            }) {
                Text("Lihat Report Kondisi Mobil")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 50)
        }
    }
}

struct CarInspectionView_Previews: PreviewProvider {
    static var previews: some View {
        // Contoh preview dengan data dummy
        let context = PersistenceController.preview.container.viewContext
        let dummyCar = Car(context: context)
        dummyCar.namaMobil = "BMW I5"
        dummyCar.tahunProduksi = 2020
        dummyCar.kilometer = 50000
        dummyCar.lokasiInspeksi = "Jakarta"
        dummyCar.catatan = "Oke"
        
        return CarInspectionView(car: dummyCar)
    }
}
