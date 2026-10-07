# Day 3 Evidence Log
- Focus: Containerization and Docker basics.
- Built image: opsdesk-api:v1.
- Verified runtime: Exposed port 8000 mapped to host 8080.
- Endpoints tested: /healthz (200 OK), /readyz (200 OK).
- Inspected logs via docker logs and validated port-mapping failure behavior.
