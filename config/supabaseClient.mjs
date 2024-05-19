import { createClient } from '@supabase/supabase-js'
import dotenv from 'dotenv'

const databaseURL = process.env.DATABASE_URL
const supabaseURL = process.env.NEXT_PUBLIC_SUPABASE_URL
const supabaseKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY
const supabase = createClient(supabaseURL, supabaseKey)

// Load environment variables
dotenv.config()

const supabaseClient = createClient(supabaseURL, supabaseKey)

export default supabaseClient
