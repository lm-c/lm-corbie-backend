import { Request, Response } from 'express';
import { UsuarioCadastroService } from '../../services/usuario/UsuarioCadastroService';
class UsuarioCadastroController {
  async handle(req: Request, res: Response) {
    const {
      id,
      nome,
      login,
      senha,
      email,
      cliente_lizard_id,
      acesso_todos_chamados,
      aprovar_orcamento,
    } = req.body;
    const model = new UsuarioCadastroService();
    const result = await model.execute({
      id,
      nome,
      login,
      senha,
      email,
      cliente_lizard_id,
      acesso_todos_chamados,
      aprovar_orcamento,
    });
    return res.json(result);
  }
}

export { UsuarioCadastroController };
