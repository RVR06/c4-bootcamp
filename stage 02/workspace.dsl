workspace "MILA" "Multiple Images Lightweight Acquisition" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		mila = softwareSystem "MILA" "Provides lightweight material acquisition facilities & crafts self-contained material assets." "" {
		}
	}
	views {
		!include theme.dslf
		
		# C4.L
		systemLandscape "SystemLandscape" "" {
			include *
			autolayout
		}
		
		# C4.1
		systemContext mila "SystemContext" "" {
			include *
			autolayout
		}
	}
}