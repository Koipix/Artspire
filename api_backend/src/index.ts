import server, { getItems } from "./server"
import { Router } from 'express';

const router = Router();
const port = 3000;

router.get('/fetchItem', getItems);
server.use(router);

server.listen(port, () => {
  console.log("Server is running...")
});
