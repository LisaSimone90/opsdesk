from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_healthz():
    response = client.get("/healthz")
    assert response.status_code == 200
    assert response.json() == {"status": "ok", "service": "opsdesk"}

def test_readyz():
    response = client.get("/readyz")
    assert response.status_code == 200
    assert response.json()["ready"] is True

def test_intentional_failure():
    assert 1 == 2