#  API Key

For the application to work: 
1. Navigate to the Config.plist file.
2. Replace the value of 'myApiKey' with your valid Pexel API key
3. Run the app!

## Troubleshooting
If after updating Config.plist with valid API Key you are still encountering a 401 error, delete the app from the simulator and rebuild.

## Future Considerations
If this was a production app, to avoid putting sensitive credentials such as API keys in the app, I would set up a proxy server and access the API via the proxy (only storying the proxy server address in the bundle). The results would then be received by the server and then passed back to the device as a normal JSON response.
