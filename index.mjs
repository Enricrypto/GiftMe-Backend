/// THIS FILE IS TO INITIALIZE THE SERVER WITH EXPRESS
import express from 'express'
import { PrismaClient } from '@prisma/client'
import { createClient } from '@supabase/supabase-js'
import dotenv from 'dotenv'
import cors from 'cors'

// Load environment variables
dotenv.config()

const app = express()
const port = process.env.PORT || 10000
const databaseURL = process.env.DATABASE_URL
const supabaseURL = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
const supabase = createClient(supabaseURL, supabaseKey)

// Enable CORS
app.use(
  cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
  })
)

// Check if DATABASE_URL is defined
if (!databaseURL) {
  throw new Error('DATABASE_URL environment variable is not defined')
}

const prisma = new PrismaClient({
  datasources: {
    db: {
      url: databaseURL
    }
  }
})

// Middleware to parse JSON bodies
app.use(express.json())

//testing that the server is LIVE on the URL
app.get('/', async (req, res) => {
  res.send('Hello, World!')
})

// // CREATE NEW USER ROUTE
// app.post('/api/create-user', async (req, res) => {
//   try {
//     console.log('Creating new user:', res)
//     const userData = req.body

//     // Create user profile
//     const newUserProfile = await prisma.userProfile.create({
//       data: {
//         name: userData.name,
//         surname: userData.surname,
//         avatarImage: userData.avatarImage,
//         email: userData.email,
//         birthDate: new Date(userData.birthDate),
//         primaryAddress: userData.primaryAddress,
//         secondaryAddress: userData.secondaryAddress
//       }
//     })
//     res.status(201).json({
//       message: 'User Profile created succesfully',
//       userProfile: newUserProfile
//     })
//   } catch (err) {
//     console.error('Error creating user', err)
//     res
//       .status(500)
//       .json({ err: 'Failed to create user profile', message: err.message })
//   }
// })

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`)
})
