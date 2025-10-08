from fastapi import FastAPI

app = FastAPI(debug=True, title="Teste FastAPI", root_path="/")

@app.get("/teste")
def index():
    return {"Message": "Olá, esse é um teste com FastAPI!"}

@app.get("/")
def home():
    return {"status": "ok", "message": "API FastAPI rodando com sucesso!"}


if __name__ == "__main__":
    import uvicorn 
    uvicorn.run("main:app", host="0.0.0.0", port=6000, reload=True)
