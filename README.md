# On-Premise Test Application V2

An enhanced Nginx-based containerized application for testing Active Directory policies, authentication flows, and network configurations in lab environments.

## 🌟 Features

### Enhanced Security
- Non-root user execution
- Security headers (CSP, X-Frame-Options, etc.)
- Rate limiting for API endpoints
- Request validation

### Monitoring & Observability
- Prometheus metrics endpoint
- Health check endpoint
- Request tracing with unique IDs
- Performance monitoring

### Advanced Logging
- Structured JSON logging
- Log rotation
- Detailed request/response logging
- Error classification

### Network Testing
- Built-in network diagnostic tools
- Header inspection
- Authentication status display
- Connection information

## 📋 Prerequisites

### Docker Environment
- Docker Engine 20.10+
- Docker Compose 2.0+
- 512MB+ available memory
- Network access to Docker Hub

### For Development
- Git
- Code editor (VSCode recommended)
- Modern web browser

## 🚀 Quick Start

1. Clone or download this repository
2. Navigate to the application directory:

```bash
cd on_premise_appV2
```

3. Start the containerized application:

```bash
docker-compose up -d
```

4. Access the application:
   - Web Interface: `http://localhost:8080`
   - Metrics: `http://localhost:9090` (Prometheus)

## ⚙️ Configuration Options

### Environment Variables
| Variable | Description | Default |
|----------|-------------|---------|
| NGINX_HOST | Host name for the server | localhost |
| NGINX_PORT | Internal port for Nginx | 80 |
| LOG_LEVEL | Logging verbosity | info |

### Custom Configuration
- Add custom Nginx configurations in `./config/`
- Log files are stored in `./logs/`
- Modify `nginx.conf` for advanced settings

## 🔍 Testing AD Integration

### Authentication Testing
1. Configure your AD environment to route to this application
2. Access the application through your domain
3. The web interface will display:
   - User ID (if authenticated)
   - Authentication method
   - Session information
   - All headers passed from authentication systems

### Network Testing
Built-in tools for network diagnostics:
```bash
# Connect to the container
docker exec -it on_premise_appv2_webapp_1 sh

# Run network tests
ping domain-controller.yourdomain.local
dig yourdomain.local
nslookup yourdomain.local
```

## 📊 Monitoring

### Health Endpoint
- `GET /health` - Returns 200 OK when application is healthy

### Metrics Endpoint
- `GET /metrics` - Prometheus-compatible metrics
- Key metrics:
  - Connection rates
  - Response times
  - Error rates
  - Resource utilization

### Logs
- Access logs: `./logs/access.log` (JSON format)
- Error logs: `./logs/error.log`
- Application logs: Available via `docker-compose logs`

## 🔒 Security Considerations

- This application is designed for testing environments only
- Container runs as non-root user for improved security
- Rate limiting protects against simple DoS attacks
- Security headers configured for enhanced client-side security

## 🔧 Troubleshooting

### Common Issues
1. **Port conflicts**: Modify `docker-compose.yml` to change mapped ports
2. **Permission errors**: Check `logs` directory permissions
3. **Container not starting**: Run `docker-compose logs` for details

### Diagnostic Commands
```bash
# Check container status
docker-compose ps

# View logs
docker-compose logs -f

# Test Nginx configuration
docker exec on_premise_appv2_webapp_1 nginx -t
```

## 🔄 Upgrading from V1

Major improvements over V1:
1. Enhanced security with non-root execution
2. Added monitoring and metrics
3. Structured logging in JSON format
4. Performance optimizations
5. Container health checks
6. API mock endpoints

## 📝 Maintenance

To stop the application:
```bash
docker-compose down
```

To update to the latest version:
```bash
git pull
docker-compose build --no-cache
docker-compose up -d
```

## 📜 License

This project is open source and available for internal use. Modify and distribute as needed for your testing environments. 