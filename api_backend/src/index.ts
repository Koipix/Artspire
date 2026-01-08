import server, { getItems, getItemById } from "./server"
import cors from 'cors';
import { Router } from 'express';

const router = Router();
const port = 3000;

router.get("/fetchItem/:id", getItemById);
router.get('/fetchItem', getItems);

server.use(cors()); //TODO: remove in production, only for testing
server.use(router);

server.listen(port, '0.0.0.0', () => {
  console.log("Server is running...")
});
