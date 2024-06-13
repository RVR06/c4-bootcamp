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
			deploymentNode "User workstation" "" "Microsoft Windows 10" "#windows" 1 {
				
				deploymentNode "Web browser" "" "Opera" "#opera" 1 {
					spa_ = containerInstance mila.spa "" "" {
					}
				}
				
				icarus_ = softwareSystemInstance icarus "" "#daedalus_, #external" {
				}
				
				deploymentNode "Virtual device" "" "Android" "#android" 1 {
					mobile_ = containerInstance mila.mobile "" "" {
					}
				}
				
				deploymentNode "Orchestration" "" "Docker-compose" "#dockerCompose" 1 {
					deploymentNode "mcr.microsoft.com/dotnet/aspnet:6.0" "" "Docker" "#docker" 1 {
						api_ = containerInstance mila.api "" "" {
							healthCheck "API is up & running" "http://localhost:5000/healthz" 60 0
						}
					}
					
					deploymentNode "mongo:latest" "" "Docker" "#docker" 1 {
						url https://hub.docker.com/_/mongo
						store_ = containerInstance mila.store "" "" {
						}
					}
				}
			}
		}
		
		prod_ = deploymentEnvironment "prod" {
			worker1_ = deploymentGroup "Worker 01"
			worker2_ = deploymentGroup "Worker 02"
			
			ws_ = deploymentNode "Matt workstation" "" "Microsoft Windows 10" "#windows" 1 {
				
				browser_ = deploymentNode "Web browser" "" "Opera" "#opera" 1 {
					spa_ = containerInstance mila.spa "" "" {
					}
				}
			}
			deploymentNode "Simon workstation" "" "Microsoft Windows 10" "#windows" 1 {
				icarus_ = softwareSystemInstance icarus worker1_,worker2_ "#daedalus_, #external" {
				}
			}
			
			phone_ = deploymentNode "Mobile device" "" "Android" "#android" 1 {
				mobile_ = containerInstance mila.mobile "" "" {
				}
			}
			
			backend_ = deploymentNode "Backend" "" "Azure" "#azure" 1 {
				gateway_ = infrastructureNode "api.application.com" "" "Application Gateway" "Microsoft Azure - Application Gateways"
				
				w01_ = deploymentNode "Worker 01" "" "Azure" "Microsoft Azure - All Resources" 1 {
					k8s_ = deploymentNode "Orchestration" "" "Kubernetes" "Microsoft Azure - Kubernetes Services" 1 {
						docker_ = deploymentNode "mcr.microsoft.com/dotnet/aspnet:6.0" " " "Docker" "Microsoft Azure - Container Instances" 1 {
							api_ = containerInstance mila.api worker1_ "" {
							}
						}
						
						deploymentNode "mongo:latest" "" "Docker" "Microsoft Azure - Container Instances" 1 {
							url https://hub.docker.com/_/mongo
							store_ = containerInstance mila.store worker1_ "" {
							}
						}
					}
				}
				
				w02_ = deploymentNode "Worker 02" "" "Azure" "Microsoft Azure - All Resources" 1 {
					k8s_ = deploymentNode "Orchestration" "" "Kubernetes" "Microsoft Azure - Kubernetes Services" 1 {
						docker_ = deploymentNode "mcr.microsoft.com/dotnet/aspnet:6.0" "" "Docker" "Microsoft Azure - Container Instances" 1 {
							api_ = containerInstance mila.api worker2_ "" {
							}
						}
						
						deploymentNode "mongo:latest" "" "Docker" "Microsoft Azure - Container Instances" 1 {
							url https://hub.docker.com/_/mongo
							store_ = containerInstance mila.store worker2_ "" {
							}
						}
					}
				}
			}
			
			prod_.phone_.mobile_ -> prod_.backend_.gateway_ "makes API call to" "" ""
			prod_.ws_.browser_.spa_ -> prod_.backend_.gateway_ "makes API call to" "" ""
			
			prod_.backend_.gateway_ -> prod_.backend_.w01_.k8s_.docker_.api_ "routes incoming calls to" "" ""
			prod_.backend_.gateway_ -> prod_.backend_.w02_.k8s_.docker_.api_ "routes incoming calls to" "" ""
		}
	}
	
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/semantic-alt/theme.json
		
		styles {
			element "Container Instance" {
				metadata true
				description true
				height 300
			}
			
			element "Software System Instance" {
				metadata true
				description true
				height 300
			}
		}
		
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
		}
		
		deployment * prod_ "ProdDeployment" "" {
			include *
		}
	}
}
