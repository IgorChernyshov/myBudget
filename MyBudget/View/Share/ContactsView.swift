//
//  ContactsView.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import Contacts
import SwiftUI

struct ContactsView: View {

	@Binding var isContactsViewPresented: Bool
	@Binding var pickedContact: String?

	@State private var contactStore = CNContactStore()
	@State private var contacts = [CNContact]()

	var body: some View {
		VStack {
			HStack {
				Text("Разделить чек")
					.font(.system(size: 20, weight: .bold))
					.foregroundStyle(Color.textPrimary)

				Spacer()

				Button {
					isContactsViewPresented = false
				} label: {
					Text("Отмена")
						.font(.system(size: 16, weight: .semibold))
						.foregroundStyle(Color.textPrimary)
				}
				.padding(.horizontal, 16)
			}

			Spacer()

			ScrollView(.vertical) {
				ForEach(contacts, id: \.identifier) { contact in
					let contactName = "\(contact.givenName) \(contact.familyName)"
					Button {
						pickedContact = contactName
						isContactsViewPresented = false
					} label: {
						ContactBubbleView(name: contactName,
										  phone: contact.phoneNumbers.first?.value.stringValue)
					}
				}
			}

			Spacer()
		}
		.padding(.horizontal, 32)
		.background(Color.background0)
		.task {
			await fetchContacts()
		}
	}

	private func fetchContacts() async {
		let isGranted = try? await contactStore.requestAccess(for: .contacts)
		guard isGranted == true else { return }

		let keysToFetch = [CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]

		let request = CNContactFetchRequest(keysToFetch: keysToFetch as [CNKeyDescriptor])

		contacts.removeAll()
		try? contactStore.enumerateContacts(with: request) { (contact, stop) in
			contacts.append(contact)
		}
	}
}

#Preview {
	ContactsView(isContactsViewPresented: .constant(true), pickedContact: .constant(""))
}
