//
//  Purchase.Category.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 20.12.2023.
//

extension Purchase {

	enum Category: String, CaseIterable {
		case groceries = "Продукты"
		case clothing = "Одежда"
		case electronics = "Электроника"
		case homeAndFurniture = "Дом и мебель"
		case health = "Здоровье"
		case entertainment = "Развлечения"
		case diningOut = "Рестораны"
		case transportation = "Транспорт"
		case travel = "Путешествия"
		case education = "Education"
		case gifts = "Подарки"
		case hobbies = "Хобби"
		case subscriptions = "Подписки"
		case charity = "Благотворительность"
		case savings = "Накопления"
		case miscellaneous = "Другое"
	}
}
