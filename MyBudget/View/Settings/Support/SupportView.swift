//
//  SupportView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct SupportView: View {

	@State private var messageText = ""
	@State private var messages = [String]()

    var body: some View {
		VStack {
			HStack {
				Text("Поддержка")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()
			}

			if !messages.isEmpty {
				VStack {
					ScrollView(.vertical) {
						ForEach(messages) { message in
							HStack {
								BubbleView(text: message)

								Spacer(minLength: 32)
							}
						}

						HStack {
							Spacer(minLength: 32)

							BubbleView(text: "Скоро здесь заработает служба поддержки, а пока присылайте свои отзывы нам на e-mail my.budget@gmail.com")
						}
					}
				}
			} else {
				VStack {
					Spacer()

					Text("Напишите нам сообщение, воспользовавшись полем внизу")
						.font(.system(size: 20, weight: .semibold))
						.foregroundStyle(Color.textPrimary)
						.multilineTextAlignment(.center)

					Spacer()
				}
			}

			HStack {
				TextField("Введите сообщение", text: $messageText)
					.textFieldStyle(.roundedBorder)
					.tint(Color.textPrimary)
					.foregroundStyle(Color.textPrimary)

				Button {
					sendMessage()
				} label: {
					Image(systemName: "arrowshape.turn.up.right.circle")
						.font(.title)
						.tint(Color.textPrimary)
				}
			}
		}
		.padding(.horizontal, 32)
    }

	private func sendMessage() {
		guard !messageText.isEmpty else { return }
		messages.append(messageText)
		messageText.removeAll()
	}
}

#Preview {
    SupportView()
}
