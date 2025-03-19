# API Mock Endpoints

This directory contains mock JSON files that simulate API endpoints for testing purposes.

## Available Endpoints

- `/api/index.json` - List of available endpoints and API information
- `/api/status.json` - System status and resource information  
- `/api/auth.json` - Authentication status and methods

## Usage

These endpoints can be accessed directly via the web server and return static JSON responses.
They are primarily intended for testing Active Directory integration and authentication flows.

## Adding New Endpoints

To add a new endpoint:

1. Create a new JSON file in this directory
2. Update the `/api/index.json` file to include the new endpoint
3. Restart the container to apply changes

## Authentication Testing

The auth endpoints can be used to test different authentication methods when integrated with
Active Directory environments. 