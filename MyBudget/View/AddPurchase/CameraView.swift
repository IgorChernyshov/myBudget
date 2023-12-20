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

	class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
		var parent: CameraView

		init(parent: CameraView) {
			self.parent = parent
		}

		func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
			if let image = info[.originalImage] as? UIImage {
				parent.capturedImage = image
			}
			parent.isCameraViewPresented = false
		}

		func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
			parent.isCameraViewPresented = false
		}
	}

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

struct ContentView: View {
	@State private var isCameraViewPresented = false
	@State private var capturedImage: UIImage?

	var body: some View {
		VStack {
			if let image = capturedImage {
				Image(uiImage: image)
					.resizable()
					.scaledToFit()
					.padding()
			} else {
				Text("No photo captured")
			}

			Button("Capture Photo") {
				isCameraViewPresented.toggle()
			}
			.sheet(isPresented: $isCameraViewPresented) {
				CameraView(isCameraViewPresented: $isCameraViewPresented, capturedImage: $capturedImage)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
