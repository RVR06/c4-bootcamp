workspace "Web Application Ecosystem" "" {
	!identifiers hierarchical
	!impliedRelationships false
	
	model {
		
		wa = softwareSystem "Web App" "Javascript-based frontend, python-based backend." "" {
			spa = container "SPA" "" "Angular" "" {
			}
			server = container "Server" "" "Python" "" {
			}
			
			spa -> server "" "" ""
			server -> spa "" "" ""
		}
		
		ws = softwareSystem "Web Server" "Blazor Server provides support for hosting Razor components on the server in an ASP.NET Core app. UI updates are handled over a SignalR connection." "" {
			url https://docs.microsoft.com/en-us/aspnet/core/blazor/?view=aspnetcore-6.0#blazor-server
			
			web = container "Blazor Server" "Hosts Razor components on the server in an ASP.NET Core app. Executes business logic." "AspNetCore" "" {
			}
		}
		
		wasm = softwareSystem "Web Assembly" "Blazor WebAssembly is a single-page app (SPA) framework for building interactive client-side web apps with .NET." "" {
			url https://docs.microsoft.com/en-us/aspnet/core/blazor/?view=aspnetcore-6.0#blazor-webassembly
			
			spa = container "Blazor WASM" "Runs .NET code inside browser thanks to wasm. " "AspNetCore" "" {
			}
		}
		
		wa_ = deploymentEnvironment "WebApp" {
			
			laptop_ = deploymentNode "Laptop" "" "Windows 10" "#windows" 1 {
				browser_ = infrastructureNode "Browser" "Lorem ipsum dolor sit amet, consectetur adipiscing elit." "Opera" "#opera, #web"
			}
			
			azure_ = deploymentNode "Azure" "" "Azure" "#azure" 1 {
				front_ = deploymentNode "nginx:1.23.3" "" "Docker" "#docker" 1 {
					spa_ = containerInstance wa.spa "" "" {
					}
				}
				back_ = deploymentNode "python:3.9.16" "" "Docker" "#docker" 1 {
					server_ = containerInstance wa.server "" "" {
					}
				}
			}
			
			laptop_.browser_ -> azure_.front_ "connects to" "" ""
		}
		
		ws_ = deploymentEnvironment "WebServer" {
			
			laptop_ = deploymentNode "Laptop" "" "Windows 10" "#windows" 1 {
				browser_ = infrastructureNode "Browser" "Lorem ipsum dolor sit amet, consectetur adipiscing elit." "Opera" "#opera, #web"
			}
			
			azure_ = deploymentNode "Azure" "" "Azure" "#azure" 1 {
				docker_ = deploymentNode "mcr.microsoft.com/dotnet/aspnet:7.0" "" "Docker" "#docker" 1 {
					web_ = containerInstance ws.web "" "" {
					}
				}
			}
			
			laptop_.browser_ -> azure_.docker_ "serves" "SignalR" ""
		}
		
		wasm_ = deploymentEnvironment "WebAssembly" {
			
			laptop_ = deploymentNode "Laptop" "" "Windows 10" "#windows" 1 {
				spa_ = containerInstance wasm.spa "" "#web" {
				}
			}
		}
		
		wasm2_ = deploymentEnvironment "WebAssembly2" {
			
			laptop_ = deploymentNode "Laptop" "" "Windows 10" "#windows" 1 {
				browser_ = infrastructureNode "Browser" "Lorem ipsum dolor sit amet, consectetur adipiscing elit." "Opera" "#opera, #web"
			}
			
			azure_ = deploymentNode "Azure" "" "Azure" "#azure" 1 {
				docker_ = deploymentNode "io.containerd.wasmedge.v1 | wasi/wasm32" "" "Docker+WASM" "#docker" 1 {
					spa_ = containerInstance wasm.spa "" "" {
					}
				}
			}
			
			laptop_.browser_ -> azure_.docker_ "connects to" "" ""
			
		}
		
		hub_ = deploymentEnvironment "Hub" {
			laptop_ = deploymentNode "Laptop" "" "Windows 10" "#windows" 1 {
				browser_ = infrastructureNode "Browser" "Lorem ipsum dolor sit amet, consectetur adipiscing elit." "Opera" "#opera, #web"
			}
			
			azure_ = deploymentNode "Azure" "" "Azure" "#azure" 1 {
				lb_ = infrastructureNode "Load Balancer" "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua." "Azure Network Load Balancer" "#balancer"
				
				wa_ = softwareSystemInstance wa "" "" {
				}
				ws_ = softwareSystemInstance ws "" "" {
				}
				
				lb_ -> wa_ "balances across" "" ""
				lb_ -> ws_ "balances across" "" ""
			}
			
			laptop_.browser_ -> azure_.lb_ "connects to" "" ""
		}
	}
	views {
		theme https://raw.githubusercontent.com/rvr06/cornifer-contrib/main/themes/semantic-alt/theme.json
		
		systemLandscape "Landscape" "" {
			include *
		}
		
		deployment * hub_ "HubDeployment" "" {
			include *
		}
		
		deployment * wa_ "WebAppDeployment" "" {
			include *
		}
		
		deployment * ws_ "WebServerDeployment" "" {
			include *
		}
		
		deployment * wasm_ "WebAssemblyDeployment" "" {
			include *
		}
		
		deployment * wasm2_ "WebAssemblyDeployment2" "" {
			include *
		}
	}
}
