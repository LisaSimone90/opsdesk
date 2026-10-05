from fastapi import FastAPI

app = FastAPI(title="OpsDesk Local API")

@app.get("/healthz")
def health_check():
    return {"status": "ok", "service": "opsdesk"}

@app.get("/readyz")
def readiness_check():
    return {"ready": True, "database": "local-only"}
