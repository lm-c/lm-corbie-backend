import prismaClient from '../../prisma';

class UsuarioDetalheService {
  async execute(id: number) {
    const result = await prismaClient.usuario.findFirst({
      where: { id: id },
      select: { id: true, nome: true, login: true, email: true },
    });
    return result;
  }
}

export { UsuarioDetalheService };
