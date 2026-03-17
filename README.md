# Simple Bank (Golang Backend)

Simple Bank is a banking backend sample project written in Go. It includes a PostgreSQL-based data store, gRPC + gRPC-Gateway (HTTP/JSON), Redis-based asynchronous processing (email verification), and Swagger documentation.

## Key Features
- User APIs for create/login/update flows
- Email verification workflow
- PostgreSQL transaction-based data processing
- gRPC server and HTTP Gateway running together
- Redis/Asynq background task processing
- Swagger UI exposure (`/swagger/`)
- Structured logging (zerolog) and graceful shutdown

## Tech Stack
- **Language**: Go
- **API**: gRPC, gRPC-Gateway (HTTP/JSON)
- **Database**: PostgreSQL, sqlc, golang-migrate
- **Async Worker**: Redis, Asynq
- **Docs**: Swagger (OpenAPI)
- **Infra/DevOps**: Docker, Docker Compose, Kubernetes manifests (`eks/`)

## Project Structure
- `main.go`: app entry point, DB migration execution, HTTP/gRPC/worker startup
- `api/`: Gin-based REST API code (includes learning/test-oriented code)
- `gapi/`: gRPC and HTTP Gateway handlers
- `db/migration/`: DB migration files
- `db/query/`, `db/sqlc/`: SQL files and sqlc-generated code
- `worker/`: asynchronous task distribution/processing (email verification task)
- `mail/`: mail sender interface and implementation
- `doc/swagger/`: Swagger static files
- `docker-compose.yaml`: local integrated runtime (Postgres, Redis, API)

## Run Locally

### 1) Prerequisites
- Go
- Docker / Docker Compose
- (Optional) tools used by Make targets: migrate, sqlc, mockgen, protoc

### 2) Environment Variables
Default values are loaded from `app.env`.

Main fields:
- `DB_SOURCE=postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable`
- `MIGRATION_URL=file://db/migration`
- `HTTP_SERVER_ADDRESS=0.0.0.0:8080`
- `GRPC_SERVER_ADDRESS=0.0.0.0:9090`
- `REDIS_ADDRESS=0.0.0.0:6379`

> `main.go` automatically runs DB migrations when the application starts.

### 3) Run with Docker Compose
```bash
docker compose up --build
```

After startup:
- HTTP Gateway: `http://localhost:8080`
- gRPC: `localhost:9090`
- Swagger UI: `http://localhost:8080/swagger/`

## Make Commands
Frequently used commands:
- `make postgres`: run PostgreSQL container
- `make createdb`: create database
- `make migrateup`: apply migrations
- `make migratedown`: rollback migrations
- `make sqlc`: generate sqlc code
- `make test`: run tests (`go test -v -cover -short ./...`)
- `make server`: run server (`go run main.go`)
- `make redis`: run Redis container
- `make proto`: generate protobuf/gRPC/gateway/swagger artifacts

## API Endpoints (HTTP Gateway)
- `POST /v1/create_user`
- `POST /v1/login_user`
- `PATCH /v1/update_user`
- `GET /v1/verify_email`

For detailed request/response schemas, check the Swagger docs.

## Test
```bash
make test
```

## Reference
- [Tech School - Backend Master Class (Go)](https://www.youtube.com/playlist?list=PLy_6D98if3ULEtXtNSY_2qN21VCKgoQAE)
