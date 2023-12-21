//
//  CameraView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI
import UIKit

struct CameraView: UIViewControllerRepresentable {
	@Binding var isCameraViewPresented: Bool
	@Binding var capturedImage: UIImage?

	func makeUIViewController(context: Context) -> UIImagePickerController {
		let picker = UIImagePickerController()
		picker.delegate = context.coordinator
		picker.sourceType = .camera
		return picker
	}

	func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

	func makeCoordinator() -> Coordinator {
		Coordinator(parent: self)
	}
}

extension CameraView {

	final class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		var parent: CameraView

		init(parent: CameraView) {
			self.parent = parent
		}

		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let image = info[.originalImage] as? UIImage {
				parent.capturedImage = resizeImage(image, targetSize: CGSize(width: 1280, height: 720))
			}
			dismissScreen()
		}

		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			dismissScreen()
		}

		private func dismissScreen() {
			withAnimation {
				parent.isCameraViewPresented = false
			}
		}

		private func resizeImage(_ image: UIImage, targetSize: CGSize) -> UIImage {
			guard image.size.width != 0, image.size.height != 0 else { return image }

			let size = image.size
			let widthRatio = targetSize.width / size.width
			let heightRatio = targetSize.height / size.height
			let newSize: CGSize

			if widthRatio > heightRatio {
				newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
			} else {
				newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
			}

			let renderer = UIGraphicsImageRenderer(size: newSize)
			let newImage = renderer.image { (context) in
				image.draw(in: CGRect(origin: CGPoint.zero, size: newSize))
			}

			return newImage
		}
	}
}
