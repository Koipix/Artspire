import server, { getItems } from "./server.ts"
import { Router } from 'express';

const router = Router();
router.get('/fetchItem', getItems);
server.use(router);

server.listen(3000, () => {
  console.log("Server is running...")
});
