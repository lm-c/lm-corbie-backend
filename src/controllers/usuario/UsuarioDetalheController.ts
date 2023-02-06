import { Request, Response } from 'express';
import { UsuarioDetalheService } from '../../services/usuario/UsuarioDetalheService';

class UsuarioDetalheController {
  async handle(req: Request, res: Response) {
    const id = req.user_id;
    const model = new UsuarioDetalheService();

    const result = await model.execute(id);
    return res.json(result);
  }
}

export { UsuarioDetalheController };
