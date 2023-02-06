import prismaClient from '../../prisma';
import { hash } from 'bcryptjs';

interface UserRequest {
  id: number;
  nome: string;
  login: string;
  senha: string;
  email: string;
  cliente_lizard_id: number;
  acesso_todos_chamados: boolean;
  aprovar_orcamento: boolean;
}

class UsuarioCadastroService {
  async execute({
    id,
    nome,
    login,
    senha,
    email,
    cliente_lizard_id,
    acesso_todos_chamados,
    aprovar_orcamento,
  }: UserRequest) {
    if (!login) throw new Error('Login Inválido!');

    const userAlreadyExixts = await prismaClient.usuario.findFirst({
      where: { login: login },
    });
    if (userAlreadyExixts) {
      console.log('Usuário já cadastrado');
      throw new Error(`Usuário ${email} já cadastrado!`);
    }
    const hashPass = await hash(senha, 8);

    const result = await prismaClient.usuario.create({
      data: {
        id: id,
        nome: nome,
        login: login,
        senha: hashPass,
        email: email,
        cliente_lizard_id: cliente_lizard_id,
        acesso_todos_chamados: acesso_todos_chamados,
        aprovar_orcamento: aprovar_orcamento,
        situacao: 1,
      },
      select: {
        id: true,
        nome: true,
        email: true,
      },
    });

    return result;
  }
}

export { UsuarioCadastroService };
