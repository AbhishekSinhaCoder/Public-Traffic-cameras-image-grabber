while ($true)
{
	$Start = Get-Date
	
	$URLs = @("https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/elizabethdr_livepool.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/fiveislands_portkembla.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/homebushbay_homebush.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/memorialdr_towradge.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/pacifichwy_macksville.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/pennanthills_beecroft.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/pacifichwy_tomago.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/shellharbour_warilla.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/yorkst_sydney.jpg", "https://www.rms.nsw.gov.au/trafficreports/cameras/camera_images/burntbrdg_seaforth.jpg")
	
	foreach ($URL in $URLs)
	{
		$Location = $((($URL -split "/")[6]) -split "\.")[0]
		$Filename = $(Get-Date -uFormat "%m%d%Y%H%M%S")
		
		Invoke-WebRequest -Uri $URL -OutFile "$Location-$Filename`.jpg"
	}
	
	$End = Get-Date
	
	[int]$TimeSpent = (New-TimeSpan -Start $Start -End $End).TotalSeconds
	
	Start-Sleep -Seconds $(60 - $TimeSpent)
}