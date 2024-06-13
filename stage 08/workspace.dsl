# © 2022 DAEDALUS, Inc.  Unauthorized use, distribution, or duplication is prohibited.
workspace "MILA" "Multiple Images Lightweight Acquisition" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		matt = person "Material scientist" "Leverages smartphone facilities to capture materials properties." ""
		simon = person "Simulation engineer" "Crafts physics-based simulation." ""
		
		mila = softwareSystem "MILA" "Provides lightweight material acquisition facilities & crafts self-contained material assets." "" {
			url https://github.com/rvr06/c4-bootcamp/blob/main/stage%2000/specs.md
			
			spa = container "Web application" "Provides limited facilities to upload constrained pictures set." "Blazor" "#web" {
			}
			mobile = container "Mobile application" "Provides uncluttered interface to ease pictures shooting, stiching & uploading." "Xamarin" "#mobile" {
				acquisition = component "Acquisition" "Handles smartphone built-in capabilities." "C#" "" {
				}
				preparation = component "Preparation" "Provides images tooling such as cropping & stitching facilities." "C#" "" {
				}
				uploading = component "Uploading" "Handles back-end communication." "C#" "" {
				}
			}
			api = container "API application" "Extracts spatially varying BRDF-Cook-Torrance with normals, diffuse, roughness & specular maps from pictures set leveraring deep neural network." "" "" {
			}
			store = container "Materials store" "Stores enriched materials & supplies powerful queries API." "MongoDB" "#db" {
			}
		}
		icarus = softwareSystem "Icarus" "Provides powerful facilities to work with physics materials." "#external" {
		}
		
		matt -> mila "sends pictures to" "" ""
		matt -> mila.spa "uses" "" ""
		matt -> mila.mobile "uses" "" ""
		
		simon -> icarus "uses" "" ""
		
		icarus -> mila "fetches materials from" "" ""
		icarus -> mila.store "fetches materials from" "" ""
		
		mila.spa -> mila.api "makes API call to" "" ""
		mila.mobile -> mila.api "makes API call to" "" ""
		mila.api -> mila.store "stores materials to" "" ""
		
		mila.mobile.acquisition -> mila.mobile.preparation "feeds" "" ""
		mila.mobile.preparation -> mila.mobile.uploading "packages" "" ""
		
		dev_ = deploymentEnvironment "dev" {
			deploymentNode "User workstation" "" "Microsoft Windows 10" "" 1 {
				
				deploymentNode "Web browser" "" "Opera" "" 1 {
					spa_ = containerInstance mila.spa "" "" {
					}
				}
				
				icarus_ = softwareSystemInstance icarus "" "" {
				}
				
				deploymentNode "Virtual device" "" "Android" "" 1 {
					mobile_ = containerInstance mila.mobile "" "" {
					}
				}
				
				deploymentNode "Orchestration" "" "Docker-compose" "" 1 {
					deploymentNode "mcr.microsoft.com/dotnet/aspnet:6.0" "" "Docker" "" 1 {
						api_ = containerInstance mila.api "" "" {
						}
					}
					
					deploymentNode "mongo:latest" "" "Docker" "" 1 {
						url https://hub.docker.com/_/mongo
						store_ = containerInstance mila.store "" "" {
						}
					}
				}
			}
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
		
		# C4.2
		container mila "Container" "" {
			include *
			animation {
				matt
				mila.spa mila.mobile
				mila.api
				mila.store
				icarus
			}
			autolayout
		}
		
		# C4.3
		component mila.mobile "mila_mobile-4_3" "" {
			include *
			autolayout lr
		}
		
		# C4.W
		dynamic mila "mila-workflow-mobile" "MILA mobile workflow" {
			matt -> mila.mobile
			mila.mobile -> mila.api
			mila.api -> mila.store
			autolayout lr
		}
		
		dynamic mila "mila-workflow-hybrid" "MILA hybrid workflow" {
			{
				matt -> mila.mobile
				mila.mobile -> mila.api
				mila.api -> mila.store
			}
			{
				matt -> mila.spa
				mila.spa -> mila.api
				mila.api -> mila.store
			}
			autolayout lr
		}
		
		# C4.D
		deployment * dev_ "DevDeployment" "" {
			include *
			autolayout lr
		}
	}
}
