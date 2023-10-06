# Define the API endpoint URL
$apiUrl = "https://ip-172-31-21-226.us-east-2.compute.internal/api/v2/job_templates/8/callback/"

$headers = @{
    "Content-Type" = "application/json"
}

$body = @{
    "host_config_key" = "redhatdemo"
} | ConvertTo-Json

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }


try {
    # Make the API request (GET request in this example)
    $response = Invoke-RestMethod -Uri $apiUrl -Method Post -Headers $headers -Body $body

    # Check if the response is successful (HTTP status code 200)
    if ($response.StatusCode -eq 200) {
        # Process the API response here
        Write-Host "API Response: $($response | ConvertTo-Json -Depth 4)"
    } else {
        # Handle non-200 status codes
        Write-Host "API request failed with status code $($response.StatusCode)"
    }
} catch {
    # Handle any exceptions that may occur during the API request
    Write-Host "An error occurred: $_"
}
