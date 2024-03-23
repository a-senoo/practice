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
migrate:
	docker compose exec app php artisan migrate
fresh:
	docker compose exec app  php artisan migrate:fresh
refresh:
	docker compose exec app php artisan migrate:refresh
rollback:
	docker compose exec app php artisan migrate:rollback	
status:
	docker compose exec app php artisan migrate:status
list:
	docker compose exec app php artisan route:list