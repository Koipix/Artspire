import server, { getItems, getItemById, processPayment } from "./server"
import express from 'express';
import cors from 'cors';
import { Router } from 'express';

const router = Router();
const port = 3000;

router.get("/fetchItem/:id", getItemById);
router.get('/fetchItem', getItems);
router.post('/api/payment', processPayment);

server.use(cors()); //TODO: remove in production, only for testing
server.use(express.json());
server.use(express.urlencoded({extended: true}));
server.use(router);

server.listen(port, '0.0.0.0', () => {
  console.log("Server is running...")
});
