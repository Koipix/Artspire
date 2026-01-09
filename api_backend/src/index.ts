import server, { getItems, getItemById, processPayment } from "./server"
import express from 'express';
import cors from 'cors';
import { Router } from 'express';

const router = Router();
const port = parseInt(process.env.PORT || '3000', 10);

router.get("/fetchItem/:id", getItemById);
router.get('/fetchItem', getItems);
router.post('/api/payment', processPayment);

server.use(cors()); //TODO: remove in production, only for testing
server.use(express.json());
server.use(express.urlencoded({extended: true}));
server.use(router);

// For local development
if (process.env.NODE_ENV !== 'production') {
  server.listen(port, '0.0.0.0', () => {
    console.log("Server is running on port " + port)
  });
}

// Export for Vercel
export default server;
