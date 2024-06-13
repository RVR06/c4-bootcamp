workspace "Hexagonal Architecture Experimentation" "Wringing Structurizr pipeline to tackle C4.4." {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		uploading = softwareSystem "Uploading component internals" "" "" {
			app = container "App.Services" "Provides services eg communication & notification." "net6.0" "#app" {
			}
			dom = container "Dom.Uploading" "Defines DDD staples such as endpoint value object." "net6.0" "#dom" {
			}
			inf = container "Inf.Android" "Surfaces device facilities such as tile notification." "Xamarin" "#inf" {
			}
			pre = container "Pre.Uploading" "Allows user to specify backend settings. Provides upload monitoring feedback." "XAML" "#pre" {
			}
		}
		
		uploading.app -> uploading.dom "operates" "" ""
		uploading.app -> uploading.inf "lererages" "" ""
		uploading.pre -> uploading.app "exercises" "" ""
	}
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/hexagonal/theme.json
		
		container uploading "HexagonalArchitecture" "" {
			include *
		}
	}
}
