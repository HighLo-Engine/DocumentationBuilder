include "vendor/bin/premake/solution_items.lua"

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"
include "Dependencies.lua"


workspace "HighLoDocsBuilder"
    architecture "x64"
    configurations { "Debug", "Release" }
    startproject "HighLoDocsBuilder"
	
	solution_items
	{
		".editorconfig"
	}

	flags
	{
		"MultiProcessorCompile"
	}
	
	project "HighLoDocsBuilder"
		kind "ConsoleApp"
		language "C++"
		cppdialect "C++17"
		staticruntime "off"
		entrypoint "mainCRTStartup"
		
		targetdir ("bin/" .. outputdir .. "/%{prj.name}")
		debugdir ("bin/" .. outputdir .. "/%{prj.name}")
		objdir ("bin-obj/" .. outputdir .. "/%{prj.name}")
		
		files
		{ 
			"src/**.h",
			"src/**.cpp"
		}
		
		includedirs
		{
		
		}
		
		links
		{
		
		}
		
		postbuildcommands
		{
		
		}
		
		filter "system:windows"
			systemversion "latest"
			
			defines
			{
				"HL_PLATFORM_WINDOWS"
			}

		filter "system:linux"
			systemversion "latest"
			
			defines
			{
				"HL_PLATFORM_LINUX"
			}

		filter "system:macos"
			systemversion "latest"
			
			defines
			{
				"HL_PLATFORM_MACOS"
			}
			
		filter "configurations:Debug"
			defines "HL_DEBUG"
			symbols "On"
			
			postbuildcommands
			{
			}
			
		filter "configurations:Release"
			defines "HL_RELEASE"
			optimize "On"

			postbuildcommands
			{
			}
			
		