#!/bin/bash

# Script để tải workflows mẫu từ n8n.io
# Usage: ./download-workflows.sh

echo "📥 Downloading sample workflows from n8n.io..."

# Tạo thư mục downloaded nếu chưa có
mkdir -p workflows/downloaded

# Danh sách một số workflow IDs phổ biến từ n8n.io
# Bạn có thể thay đổi IDs này bằng workflows bạn muốn

WORKFLOWS=(
  "1234" # Replace with actual workflow IDs from n8n.io/workflows
  "5678"
)

echo ""
echo "💡 Tip: Bạn có thể tìm workflow IDs tại https://n8n.io/workflows"
echo ""
echo "Để tải workflow:"
echo "1. Truy cập https://n8n.io/workflows"
echo "2. Chọn workflow bạn muốn"
echo "3. Click 'Download' để tải file JSON"
echo "4. Đặt file vào thư mục workflows/ hoặc workflows/downloaded/"
echo ""
echo "Hoặc copy URL của workflow và import trực tiếp trong n8n UI:"
echo "  n8n → New Workflow → ... → Import from URL"
echo ""

# Các workflow phổ biến có thể tìm thấy:
echo "🔥 Một số workflows phổ biến:"
echo ""
echo "📧 Email & Communication:"
echo "  - Send emails with Gmail"
echo "  - Slack notifications"
echo "  - Discord webhooks"
echo ""
echo "🤖 AI & Automation:"
echo "  - OpenAI/ChatGPT integration"
echo "  - AI content generation"
echo "  - Sentiment analysis"
echo ""
echo "📊 Data & Analytics:"
echo "  - Google Sheets automation"
echo "  - Airtable sync"
echo "  - Database operations"
echo ""
echo "🌐 APIs & Webhooks:"
echo "  - REST API workflows"
echo "  - Webhook handlers"
echo "  - API integrations"
echo ""

echo "✅ Xem thêm tại:"
echo "  - https://n8n.io/workflows"
echo "  - https://n8n.io/integrations"
echo "  - https://github.com/n8n-io/n8n-workflow-examples"
echo ""
