import express from 'express';
import path from 'path';
import { fileURLToPath } from 'url';
import serveStatic from 'serve-static';
import cors from 'cors';
import bodyParser from 'body-parser';
import history from 'connect-history-api-fallback';
import dotenv from 'dotenv';

// Load environment variables
dotenv.config();

const app = express();
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const PORT = process.env.PORT || 3000;

// Middleware
app.use(cors());
app.use(bodyParser.json());
app.use(history());
app.use(serveStatic(path.join(__dirname, 'dist')));

// API routes can be added here

// Start server
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});