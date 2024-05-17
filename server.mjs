/// THIS FILE IS TO INITIALIZE THE SERVER WITH EXPRESS
import express from 'express'
import cors from 'cors'
import usersRoutes from './routes/usersRoutes.mjs'
import dotenv from 'dotenv'
import dbConfig from './config/dbConfig.mjs'

// Load environment variables
dotenv.config()

const app = express()
const port = process.env.PORT || 10000

import cors from 'cors'
import express from 'express'

// Enable CORS
app.use(
  cors({
    origin: '*',
    methods: ['GET', 'POST', 'PUT', 'DELETE'],
    allowedHeaders: ['Content-Type', 'Authorization']
  })
)

// Middleware to parse JSON bodies
app.use(express.json())

// Routes
app.use('/api/users', usersRoutes)
// app.use('/api/groups', groupsRoutes)
// app.use('/api/wishlists', wishlistsRoutes)

// Database connection
dbConfig()

//testing that the server is LIVE on the URL
app.get('/', async (req, res) => {
  res.send('Hello, World!')
})

app.listen(port, () => {
  console.log(`Server is listening on port ${port}`)
})
