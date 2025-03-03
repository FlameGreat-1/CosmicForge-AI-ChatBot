---
title: CosmicForge AI Medical Chatbot
emoji: 🌌
colorFrom: purple
colorTo: blue
sdk: docker
pinned: false
license: apache-2.0
short_description: Advanced AI-powered medical information chatbot
---

# CosmicForge AI Medical Chatbot API

## API Base URL
`https://flamegreat01-cosmicforge-ai-chatbot.hf.space`

## Authentication
Use the API key in the 'access_token' header for all requests.

## Main Endpoints

- `POST /api/chat`: Submit a medical query to the chatbot
- `GET /api/chat/status/{task_id}`: Check the status of a chat response
- `GET /api/chat/{response_id}`: Retrieve a completed chat response
- `GET /health`: Check the API's health status

## API Documentation
Detailed API documentation is available at:
`https://flamegreat01-cosmicforge-ai-chatbot.hf.space/docs`

## Note on Asynchronous Processing
Chat responses are processed asynchronously. After submitting a query, you'll need to poll the status endpoint until the response is complete.

## Expected Response Time
Response times may vary depending on the complexity of the query. Implement appropriate UI feedback for users during this wait time.

## Error Handling
Implement robust error handling in the frontend, especially for network issues or longer processing times.

## Scope of Information
CosmicForge AI Chatbot provides information on general medical topics, health lifestyles, treatments, and medications. It does not provide personalized medical diagnoses or replace professional medical advice.

Check out the configuration reference at https://huggingface.co/docs/hub/spaces-config-reference
