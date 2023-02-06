import { Request, Response } from 'express';
import { UsuarioLoginService } from '../../services/usuario/UsuarioLoginService';

class UsuarioLoginController {
  async handle(req: Request, res: Response) {
    const { login, senha } = req.body;
    const model = new UsuarioLoginService();
    const result = await model.execute({ login, senha });
    return res.json(result);
  }
}

export { UsuarioLoginController };
