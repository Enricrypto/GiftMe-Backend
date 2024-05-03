/// THIS FILE IS TO INITIALIZE THE SERVER WITH EXPRESS
import express from 'express'
import { PrismaClient } from '@prisma/client'
import { createClient } from '@supabase/supabase-js'
import dotenv from 'dotenv'
import cors from 'cors'

// Load environment variables
dotenv.config()

const app = express()
const port = process.env.PORT || 3000
const databaseURL = process.env.DATABASE_URL
const URL = process.env.NEXT_PUBLIC_SUPABASE_URL
const anonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
const supabase = createClient(URL, anonKey)

// Enable CORS
app.use(cors())

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

//SIGN-UP ROUTE
app.post('/api/signup', async (req, res) => {
  try {
    const { email, password } = req.body

    //signup the user in the auth.users table
    const { data, error } = await supabase.auth.signUp({
      email,
      password
    })

    console.log('Data:', data) // Log user object

    if (error) {
      console.error('Error signing up:', error.message)
      return res
        .status(400)
        .json({ error: 'Failed to sign up', message: error.message })
    }

    // Extract the user data from the response
    // const userData = data.user

    // Store the user data in localStorage - Need to setup localstorage
    // localStorage.setItem('userData', JSON.stringify(userData))

    res.status(201).json({ message: 'Sign up succesful', data })
  } catch (err) {
    console.error('Error signing up:', err.message)
    res.status(500).json({ error: 'Failed to sign up', message: err.message })
  }
})

// CREATE NEW USER ROUTE
app.post('/api/create-user', async (req, res) => {
  try {
    console.log('Creating new user:', res)
    const userData = req.body

    // Retrieve the user data from localStorage
    // const user = JSON.parse(localStorage.getItem('userData'))

    // Create user profile
    const newUserProfile = await prisma.userProfile.create({
      data: {
        name: userData.name,
        surname: userData.surname,
        avatarImage: userData.avatarImage,
        email: userData.email,
        password: userData.password,
        birthDate: new Date(userData.birthDate),
        primaryAddress: userData.primaryAddress,
        secondaryAddress: userData.secondaryAddress
      }
    })
    res.status(201).json({
      message: 'User Profile created succesfully',
      userProfile: newUserProfile
    })
  } catch (err) {
    console.error('Error creating user', err)
    res
      .status(500)
      .json({ err: 'Failed to create user profile', message: err.message })
  }
})

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`)
})
// })
