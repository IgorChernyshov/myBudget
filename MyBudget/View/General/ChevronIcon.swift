//
//  ChevronIcon.swift
//  MyBudget
//
//  Created by Игорь Чернышов on 19.12.2023.
//

import SwiftUI

struct ChevronIcon: View {

	let direction: Direction

	var body: some View {
		Image(systemName: "chevron.\(direction)")
			.foregroundColor(Color.textSecondary)
			.if(direction == .right) { chevron in
				chevron.padding(.trailing, 4)
			}
	}
}

extension ChevronIcon {
	enum Direction {
		case down
		case right
	}
}

#Preview {
	ChevronIcon(direction: .right)
}
