from fastapi import FastAPI

app = FastAPI(title="OpsDesk API")

@app.get("/")
def read_root():
    return {"service": "opsdesk-api", "status": "running"}

@app.get("/health")
def health():
    return {"status": "healthy"}

@app.get("/healthz")
def health_check():
    return {"status": "ok", "service": "opsdesk"}

@app.get("/readyz")
def readiness_check():
    return {"ready": True, "database": "local-only"}