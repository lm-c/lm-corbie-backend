import { compare, hash } from 'bcryptjs';
import { sign } from 'jsonwebtoken';
import prismaClient from 'src/prisma';

interface AuthRequest {
  login: string;
  senha: string;
}

class UsuarioLoginService {
  async execute({ login, senha }: AuthRequest) {
    const usuario = await prismaClient.usuario.findFirst({
      where: {
        login: login,
      },
      select: { id: true, nome: true, email: true, senha: true },
    });

    if (!usuario) throw new Error('Usuário ou senha incorreto!');

    const passMatch = await compare(senha, usuario.senha);

    if (!passMatch) throw new Error('Usuário ou senha não confere!');

    const token = sign(
      {
        name: usuario.nome,
        email: usuario.email,
      },
      process.env.JWT_SECRET,
      {
        subject: usuario.id.toString(),
        expiresIn: '30d',
      }
    );

    return {
      id: usuario.id,
      name: usuario.nome,
      email: usuario.email,
      token: token,
    };
  }
}

export { UsuarioLoginService };
