# © 2022 DAEDALUS, Inc. Unauthorized use, distribution, or duplication is prohibited.
workspace "MILA" "Multiple Images Lightweight Acquisition" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		matt = person "Material scientist" "Leverages smartphone facilities to capture materials properties." ""
		simon = person "Simulation engineer" "Crafts physics-based simulation." ""
		
		mila = softwareSystem "MILA" "Provides lightweight material acquisition facilities & crafts self-contained material assets." "" {
			url https://github.com/rvr06/c4-bootcamp/blob/main/stage%2000/specs.md
		}
		icarus = softwareSystem "Icarus" "Provides powerful facilities to work with physics materials." "#external" {
		}
		
		matt -> mila "sends pictures to" "" ""
		simon -> icarus "uses" "" ""
		
		icarus -> mila "fetches materials from" "" ""
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
