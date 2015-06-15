## Changelog

### 0.3.6

- Added Scripter for handling script logic
- Ensure script is only output once for each request, but again for next request
by moving state to instance level (fixes bug in 3.5)
- Specs added to test if script works correctly on multiple requests