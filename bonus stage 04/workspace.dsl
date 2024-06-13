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
		
		blazor = softwareSystem "Blazor" "Use the power of .NET and C# to build full stack web apps without writing a line of JavaScript." "#fwk, #external" {
			url https://dotnet.microsoft.com/en-us/apps/aspnet/web-apps/blazor
		}
		
		mongodb = softwareSystem "Mongo DB" "Developer data platform that provides the services and tools necessary to build distributed applications fast, at the performance and scale users demand." "#fwk, #external" {
			url https://www.mongodb.com/
		}
		
		xamarin = softwareSystem "Xamarin" "Free. Cross-platform. Open source. An app platform for building Android and iOS apps with .NET and C#." "#fwk, #external" {
			url https://learn.microsoft.com/en-us/xamarin/get-started/what-is-xamarin
		}
		
		mila -> blazor "leverages" "" ""
		mila -> mongodb "leverages" "" ""
		mila -> xamarin "leverages" "" ""
	}
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/semantic-alt/theme.json
		
		styles {
			element "#fwk" {
				shape Component
				metadata false
			}
		}
		
		systemLandscape "TechStack" "" {
			include mila
			include element.tag==#fwk
			autoLayout
		}
		
		systemLandscape "SystemLandscape" "" {
			include *
			exclude element.tag==#fwk
			autoLayout
		}
		
		systemContext mila "SystemContext" "" {
			include *
			exclude element.tag==#fwk
			autoLayout
		}
	}
}
