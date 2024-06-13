workspace "MILA" "Multiple Images Lightweight Acquisition" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		mila = softwareSystem "MILA" "Provides lightweight material acquisition facilities & crafts self-contained material assets." "" {
			spa = container "Web application" "Provides limited facilities to upload constrained pictures set." "Blazor" "#web" {
			}
			mobile = container "Mobile application" "Provides uncluttered interface to ease pictures shooting, stiching & uploading." "Xamarin" "#mobile" {
			}
			api = container "API application" "Extracts spatially varying BRDF-Cook-Torrance with normals, diffuse, roughness & specular maps from pictures set leveraring deep neural network." "" "" {
			}
			store = container "Materials store" "Stores enriched materials & supplies powerful queries API." "MongoDB" "#db" {
			}
		}
	}
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/semantic-alt/theme.json
		
		systemLandscape "SystemLandscape" "" {
			include *
			autoLayout
		}
		
		systemContext mila "SystemContext" "" {
			include *
			autoLayout
		}
	}
}
