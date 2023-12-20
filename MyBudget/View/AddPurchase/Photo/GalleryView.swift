//
//  GalleryView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

import PhotosUI
import SwiftUI

struct GalleryView: UIViewControllerRepresentable {

	@Binding var selectedPhoto: UIImage?

	func makeCoordinator() -> Coordinator {
		return Coordinator(parent: self)
	}

	func makeUIViewController(context: Context) -> PHPickerViewController {
		var configuration = PHPickerConfiguration()
		configuration.filter = .images
		configuration.selectionLimit = 1

		let picker = PHPickerViewController(configuration: configuration)
		picker.delegate = context.coordinator
		return picker
	}

	func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) {}

	private func processSelectedPhoto(assets: [PHPickerResult]) {
		for asset in assets {
			if asset.itemProvider.canLoadObject(ofClass: UIImage.self) {
				asset.itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
					if let image = image as? UIImage {
						selectedPhoto = image
					}
				}
			}
		}
	}
}

extension GalleryView {

	final class Coordinator: NSObject, PHPickerViewControllerDelegate {

		var parent: GalleryView

		init(parent: GalleryView) {
			self.parent = parent
		}

		func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
			parent.processSelectedPhoto(assets: results)
			picker.dismiss(animated: true, completion: nil)
		}
	}
}

#Preview {
	GalleryView(selectedPhoto: .constant(nil))
}
