import { hash } from 'bcrypt';
import { prisma } from '../../../database/prismaClient'

interface ICreateUser {
    username: string;
    name: string;
    password: string;
}

export class CreateUserUseCase {
   async execute({ password, username, name}:ICreateUser) => {
    
    const usernameAlreadyExists = await prisma.user.findFirst({
           where: {
               username: {
                   mode: "insensitive"
               }
           }
       });

    if (usernameAlreadyExists) {
        throw new Error("Username already exists");
    }

    const hashPassword = hash(password, 10)
   }
}
