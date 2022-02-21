import { PrismaClient } from '@prisma/client';


const prisma = new PrismaClient();

async function main() {
    const result = await prisma.user.create({
        data: {
            name: "Yua",
            username: "yua",
            Equipamento: {
                create:{
                    patrimonio: "angel123",
                    description:"pc do yua"
                }
            }            
        }
    });
    console.log(result);
}
main();