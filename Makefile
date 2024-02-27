.PHONY: setup up d b ps node

setup:
	@make up
	@make ps
down:
	docker-compose down --remove-orphans
up:
	docker compose up -d
ps:
	docker compose ps
node:
	docker compose exec node bash
app:
	docker compose exec app bash
db:
	docker compose exec db bash