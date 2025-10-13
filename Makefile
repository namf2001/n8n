.PHONY: start stop restart logs clean backup restore

# Start n8n
start:
	@echo "🚀 Starting n8n..."
	docker-compose up -d
	@echo "✅ n8n is running at http://localhost:5678"
	@echo "👤 Username: admin"
	@echo "🔑 Password: admin123"

# Stop n8n
stop:
	@echo "🛑 Stopping n8n..."
	docker-compose down
	@echo "✅ Stopped"

# Restart n8n
restart:
	@echo "🔄 Restarting n8n..."
	docker-compose restart
	@echo "✅ Restarted"

# View logs
logs:
	docker-compose logs -f

# Clean everything (including volumes)
clean:
	@echo "⚠️  This will delete all data! Press Ctrl+C to cancel..."
	@sleep 5
	docker-compose down -v
	@echo "✅ Cleaned"

# Backup database
backup:
	@echo "💾 Backing up database..."
	docker-compose exec postgres pg_dump -U n8n n8n > backup_$$(date +%Y%m%d_%H%M%S).sql
	@echo "✅ Backup completed"

# Restore database
restore:
	@echo "📥 Restoring database..."
	@read -p "Enter backup file path: " backup_file; \
	docker-compose exec -T postgres psql -U n8n n8n < $$backup_file
	@echo "✅ Restore completed"

# Check status
status:
	docker-compose ps

# Open n8n in browser
open:
	open http://localhost:5678
