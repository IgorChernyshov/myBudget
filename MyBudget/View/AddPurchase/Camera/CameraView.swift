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
				parent.capturedImage = image
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
	}
}
