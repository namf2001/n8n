# n8n Docker Setup

Setup n8n với Docker và PostgreSQL trên macOS.

## 📋 Yêu cầu

- Docker Desktop for Mac đã cài đặt
- Docker Compose

## 🚀 Khởi động

### 1. Start n8n

```bash
docker-compose up -d
```

### 2. Kiểm tra logs

```bash
docker-compose logs -f n8n
```

### 3. Truy cập n8n

Mở trình duyệt và truy cập: http://localhost:5678

**Thông tin đăng nhập mặc định:**
- Username: `admin`
- Password: `admin123`

## 📥 Import Workflows

### Workflows mẫu trong thư mục `/workflows`

Thư mục này chứa các workflow mẫu:
- `01-hello-world-webhook.json` - Webhook đơn giản trả về JSON
- `02-scheduled-email-notification.json` - Gửi email định kỳ hàng ngày
- `03-ai-chat-api.json` - API chat với AI (mock response)
- `04-test-google-sheets.json` - Test Google Sheets connection
- `05-debug-code-node-scenes.json` - Debug scene extraction
- `06-fixed-scene-extraction.json` - Fixed scene extraction code
- `07-http-request-auth-examples.json` - HTTP authentication examples
- `08-wavespeed-ai-api.json` - WaveSpeed.ai Text-to-Video API
- `09-google-veo-3-api.json` - **Google Veo 3 Text-to-Video API** ⭐ NEW

### Cách import workflow:

#### Cách 1: Import từ File
1. Đăng nhập vào n8n tại http://localhost:5678
2. Click **"+ Add workflow"** hoặc **"New"**
3. Click menu **"⋮"** (góc trên bên phải) → **"Import from file"**
4. Chọn file JSON từ thư mục `workflows/`
5. Click **"Import"**

#### Cách 2: Import từ URL
1. Click **"+ Add workflow"**
2. Click **"⋮"** → **"Import from URL"**
3. Paste URL của workflow JSON
4. Click **"Import"**

#### Cách 3: Copy & Paste
1. Mở file JSON workflow
2. Copy toàn bộ nội dung
3. Trong n8n, click **"⋮"** → **"Import from clipboard"**
4. Workflow sẽ được import tự động

### 🌐 Nguồn workflows miễn phí:

- **n8n.io/workflows** - Hàng nghìn templates từ cộng đồng
- **n8n.io/integrations** - Workflows theo app/service
- **GitHub** - https://github.com/n8n-io/n8n-workflow-examples
- **Community Forum** - https://community.n8n.io

### Troubleshooting Guides

Các file markdown hướng dẫn troubleshooting:
- `CODE_NODE_TROUBLESHOOTING.md` - Xử lý lỗi trong Code node
- `GOOGLE_SHEETS_TROUBLESHOOTING.md` - Xử lý lỗi Google Sheets
- `HTTP_REQUEST_CREDENTIALS.md` - Hướng dẫn HTTP authentication
- `N8N_CODE_NODE_VARIABLES.md` - Guide về n8n variables
- `WAVESPEED_AI_SETUP.md` - Setup WaveSpeed.ai API
- `GOOGLE_VEO3_SETUP.md` - **Setup Google Veo 3 API** ⭐ NEW

### Test Workflows

#### Test Hello World Webhook:
```bash
# Sau khi import và activate workflow
curl http://localhost:5678/webhook/hello
```

#### Test AI Chat API:
```bash
curl -X POST http://localhost:5678/webhook/chat \
  -H "Content-Type: application/json" \
  -d '{"message": "Hello, how are you?"}'
```

## 🔑 Tạo API Key

### Cách 1: Từ n8n UI
1. Đăng nhập vào n8n
2. Vào **Settings** → **API**
3. Click **Generate API Key**
4. Copy key và lưu vào file `.env`

### Cách 2: Sử dụng curl

```bash
# Login và lấy token
curl -X POST http://localhost:5678/rest/login \
  -H "Content-Type: application/json" \
  -d '{
    "email": "admin",
    "password": "admin123"
  }'
```

## 📝 Các lệnh hữu ích

### Dừng n8n
```bash
docker-compose down
```

### Restart n8n
```bash
docker-compose restart
```

### Xem logs
```bash
docker-compose logs -f
```

### Backup database
```bash
docker-compose exec postgres pg_dump -U n8n n8n > backup.sql
```

### Restore database
```bash
docker-compose exec -T postgres psql -U n8n n8n < backup.sql
```

### Xóa tất cả (bao gồm data)
```bash
docker-compose down -v
```

## 🔧 Cấu hình

Chỉnh sửa file `.env` để thay đổi cấu hình:

- `N8N_BASIC_AUTH_USER`: Username đăng nhập
- `N8N_BASIC_AUTH_PASSWORD`: Password đăng nhập
- `POSTGRES_PASSWORD`: Password database
- `GENERIC_TIMEZONE`: Múi giờ

## 📚 API Endpoints

### Get workflows
```bash
curl -X GET http://localhost:5678/rest/workflows \
  -H "Authorization: Bearer YOUR_API_KEY"
```

### Execute workflow
```bash
curl -X POST http://localhost:5678/rest/workflows/:id/execute \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{"data": {}}'
```

## 🔗 Resources

- [n8n Documentation](https://docs.n8n.io/)
- [n8n Workflows](https://n8n.io/workflows/)
- [n8n Community](https://community.n8n.io/)
- [n8n GitHub](https://github.com/n8n-io/n8n)

## ⚠️ Security Notes

- Thay đổi password mặc định trước khi deploy production
- Không commit file `.env` vào Git
- Sử dụng HTTPS trong production
- Backup database định kỳ
