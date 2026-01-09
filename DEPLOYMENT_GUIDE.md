# Vercel Deployment - What I Did

## Summary
I've successfully prepared your backend code for Vercel deployment! Here's what was done:

## Changes Made

### 1. **Created `vercel.json`** (Root directory)
This configuration file tells Vercel how to deploy your backend:
- Uses `@vercel/node` to handle Node.js/TypeScript
- Routes all requests to your Express app
- Enables serverless function deployment

### 2. **Updated `api_backend/src/index.ts`**
Modified to work both locally AND on Vercel:
- Added environment-aware server startup (only listens locally, not in production)
- Fixed port handling to use `process.env.PORT`
- Exports the Express app for Vercel to use
- Now supports both development and production modes

### 3. **Updated `api_backend/src/server.ts`**
- Changed Stripe initialization to use `process.env.STRIPE_SECRET_KEY`
- No more hardcoded empty string for API key

### 4. **Created `api_backend/.env.example`**
- Template file showing required environment variables
- Documents STRIPE_SECRET_KEY, PORT, and NODE_ENV
- Safe to commit (doesn't contain actual secrets)

### 5. **Updated `.gitignore`**
- Added exception for `.env.example` so it can be committed
- Keeps actual `.env` files private

### 6. **Created `api_backend/README.md`**
Comprehensive documentation including:
- Local development setup
- Two deployment methods (Dashboard & CLI)
- Environment variable configuration
- API endpoint documentation
- Testing examples
- Troubleshooting guide

## How to Deploy to Vercel

### Quick Method (Using Vercel Dashboard):

1. **Push your code to GitHub** (already done!)

2. **Go to Vercel**:
   - Visit https://vercel.com
   - Sign in with GitHub
   - Click "Add New..." → "Project"
   - Import the `Koipix/Artspire` repository

3. **Configure Settings**:
   - Vercel will auto-detect the `vercel.json` configuration
   - Root Directory: Leave as default (or set to `/`)
   - Framework Preset: Other

4. **Add Environment Variable**:
   - In project settings, add:
     - Name: `STRIPE_SECRET_KEY`
     - Value: Your actual Stripe secret key (get from Stripe dashboard)
   - You can use test key: `sk_test_...` for testing

5. **Deploy**: Click "Deploy" and wait ~1-2 minutes

6. **Done!** Your API will be live at `https://your-project.vercel.app/`

### Test Your Deployment:

```bash
# Health check
curl https://your-project.vercel.app/

# Get all items
curl https://your-project.vercel.app/fetchItem

# Get specific item
curl https://your-project.vercel.app/fetchItem/1

# Test payment (requires valid Stripe key)
curl -X POST https://your-project.vercel.app/api/payment \
  -H "Content-Type: application/json" \
  -d '{"amount": 1000, "currency": "usd"}'
```

## What's Working Now

✅ TypeScript compilation (verified with `npm run build`)
✅ Express server setup
✅ All API routes configured:
  - `GET /` - Health check
  - `GET /fetchItem` - Get all items
  - `GET /fetchItem/:id` - Get item by ID
  - `POST /api/payment` - Stripe payment processing
✅ CORS enabled for cross-origin requests
✅ Environment variable support
✅ Local development mode
✅ Vercel serverless deployment mode

## Important Notes

1. **Stripe API Key**: You MUST add your Stripe secret key as an environment variable in Vercel
   - Get it from: https://dashboard.stripe.com/apikeys
   - Use test key for testing: starts with `sk_test_`
   - Use live key for production: starts with `sk_live_`

2. **CORS**: Currently set to allow all origins (`cors()`)
   - For production, update to specific domains in `src/index.ts`

3. **Local Development**: Still works with `npm run dev`
   - Create a `.env` file based on `.env.example`
   - Add your Stripe key there

## Next Steps (Optional Improvements)

- Add rate limiting for production
- Implement proper error handling/logging
- Add authentication for sensitive endpoints
- Connect to a real database instead of in-memory data
- Configure CORS to only allow your Flutter app's domain
- Add request validation middleware

## Need Help?

Check the detailed README at `api_backend/README.md` for more information!
