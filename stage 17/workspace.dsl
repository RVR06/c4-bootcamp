workspace extends core/workspace.dsl {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		!ref mila.mobile {
			acquisition = component "Acquisition" "Handles smartphone built-in capabilities." "C#" "" {
			}
			preparation = component "Preparation" "Provides images tooling such as cropping & stitching facilities." "C#" "" {
			}
			uploading = component "Uploading" "Handles back-end communication." "C#" "" {
			}
			
			acquisition -> preparation "Feeds" "" ""
			preparation -> uploading "Packages" "" ""
		}
		
		!ref mila {
			maui = container "Mobile application (revamped)" "Provides uncluttered interface to ease pictures shooting, stiching & uploading." "MAUI" "#mobile, #newcomer" {
				url https://dotnet.microsoft.com/en-us/apps/maui
			}
			
			maui -> mila.api "makes API call to" "" ""
		}
		
		!ref matt {
			-> mila.maui "uses" "" ""
		}
	}
	
	views {
		# C4.3
		component mila.mobile "mila_mobile-4_3" "" {
			include *
		}
		
		styles {
			element "#newcomer" {
				opacity 50
			}
		}
		
		container mila "what_s_next" "What's next?" {
			include *
			exclude mila.mobile
		}
	}
}
