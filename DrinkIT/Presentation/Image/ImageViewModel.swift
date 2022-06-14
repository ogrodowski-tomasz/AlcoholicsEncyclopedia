//
//  ImageViewModel.swift
//  DrinkIT
//
//  Created by Tomasz Ogrodowski on 10/06/2022.
//

import Foundation
import UIKit

@MainActor
final class ImageViewModel: ObservableObject {
    var getImageUseCase = GetImageUseCase(repository: ImageRespositoryImpl(dataSource: ImageDataSourceImpl()))

    @Published var image: UIImage = UIImage(systemName: "questionmark.square.fill")!
    @Published var errorMessage = ""
    @Published var hasError = false

    func getImage(url: URL, forName name: String) async {
        errorMessage = ""
        do {
            self.image = try await getImageUseCase.execute(url: url, forName: name)
        } catch {
            errorMessage = error.localizedDescription
            hasError = true
        }
    }
}
