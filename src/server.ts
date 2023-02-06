import express, { Request, Response, NextFunction } from 'express';
import 'express-async-errors';
import cors from 'cors';

import { router } from './routes';

const app = express();
app.use(express.json());
app.use(cors());

app.use(router);

app.get('/', (req: Request, res: Response) => {
  return res.json({
    stt: 'Sistema em Produção!',
    cli: 'Customax Tecnologia',
    dev: 'Leonardo Michalak',
  });
});

app.use((err: Error, req: Request, res: Response, next: NextFunction) => {
  if (err instanceof Error) {
    return res.status(400).json({
      error: err.message,
    });
  }

  return res.status(500).json({
    status: 'Error',
    message: 'Internal server error',
  });
});

app.listen(process.env.PORT || 3000, () =>
  console.log('Servidor Online, porta 3000!')
);
