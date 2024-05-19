import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

const dbConfig = async () => {
  try {
    await prisma.$connect()
    console.log('Database connected successfully')
  } catch (error) {
    console.error('Database connection error:', error)
    process.exit(1)
  }
}

export default dbConfig
