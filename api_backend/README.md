# Artspire Backend - Vercel Deployment Guide

## Overview
This is the backend API for Artspire, built with Express.js and TypeScript, designed to be deployed on Vercel as serverless functions.

## API Endpoints

- `GET /` - Health check endpoint (returns "nyallo!")
- `GET /fetchItem` - Fetch all art items
- `GET /fetchItem/:id` - Fetch a specific art item by ID
- `POST /api/payment` - Process Stripe payment

## Local Development

### Prerequisites
- Node.js (v18 or higher recommended)
- npm or yarn
- Stripe account (for payment processing)

### Setup

1. Navigate to the backend directory:
```bash
cd api_backend
```

2. Install dependencies:
```bash
npm install
```

3. Create a `.env` file based on `.env.example`:
```bash
cp .env.example .env
```

4. Add your Stripe secret key to `.env`:
```
STRIPE_SECRET_KEY=sk_test_your_actual_stripe_key
NODE_ENV=development
PORT=3000
```

5. Run the development server:
```bash
npm run dev
```

The server will start on `http://localhost:3000`

### Build

To build the TypeScript code:
```bash
npm run build
```

To run the built version:
```bash
npm start
```

## Vercel Deployment

### Prerequisites
- Vercel account (free tier works)
- Vercel CLI (optional but recommended)

### Option 1: Deploy via Vercel Dashboard (Easiest)

1. Push your code to GitHub
2. Go to [vercel.com](https://vercel.com) and sign in
3. Click "Add New..." → "Project"
4. Import your GitHub repository
5. Vercel will auto-detect the configuration from `vercel.json`
6. Add environment variables in the project settings:
   - `STRIPE_SECRET_KEY`: Your Stripe secret key
   - `NODE_ENV`: production
7. Click "Deploy"

### Option 2: Deploy via Vercel CLI

1. Install Vercel CLI globally:
```bash
npm i -g vercel
```

2. From the project root directory, run:
```bash
vercel
```

3. Follow the prompts to link your project

4. Add environment variables:
```bash
vercel env add STRIPE_SECRET_KEY
```
Enter your Stripe secret key when prompted, and select "Production"

5. Deploy to production:
```bash
vercel --prod
```

### Environment Variables (Production)

Make sure to set these in your Vercel project settings:

| Variable | Description | Example |
|----------|-------------|---------|
| `STRIPE_SECRET_KEY` | Your Stripe secret API key | `sk_live_...` or `sk_test_...` |
| `NODE_ENV` | Environment mode | `production` |

### Accessing Your Deployed API

After deployment, your API will be available at:
```
https://your-project-name.vercel.app/
```

Example endpoints:
- `https://your-project-name.vercel.app/fetchItem`
- `https://your-project-name.vercel.app/fetchItem/1`
- `https://your-project-name.vercel.app/api/payment`

## Project Structure

```
api_backend/
├── src/
│   ├── index.ts          # Main entry point & Express app setup
│   ├── server.ts         # Server logic, routes & handlers
│   └── models/
│       ├── ArtItem.ts    # ArtItem type definitions
│       └── Artist.ts     # Artist type definitions
├── package.json          # Dependencies & scripts
├── tsconfig.json         # TypeScript configuration
├── nodemon.json          # Nodemon configuration (dev)
└── .env.example          # Example environment variables

vercel.json               # Vercel deployment configuration
```

## Testing Your Deployment

### Test the health endpoint:
```bash
curl https://your-project-name.vercel.app/
```

### Test fetching items:
```bash
curl https://your-project-name.vercel.app/fetchItem
```

### Test fetching a specific item:
```bash
curl https://your-project-name.vercel.app/fetchItem/1
```

### Test payment processing:
```bash
curl -X POST https://your-project-name.vercel.app/api/payment \
  -H "Content-Type: application/json" \
  -d '{"amount": 1000, "currency": "usd"}'
```

## Troubleshooting

### Build Errors
- Make sure all TypeScript types are properly defined
- Check that `tsconfig.json` is properly configured
- Verify all dependencies are in `package.json`

### Runtime Errors
- Check Vercel logs in your dashboard
- Verify environment variables are set correctly
- Ensure CORS is properly configured for your frontend domain

### CORS Issues
Update the CORS configuration in `src/index.ts` to specify your frontend domain:
```typescript
server.use(cors({
  origin: 'https://your-frontend-domain.com'
}));
```

## Security Notes

- Never commit your `.env` file or expose your Stripe secret key
- Use Stripe test keys during development
- Switch to live keys only in production
- Consider implementing rate limiting for production
- Add proper authentication/authorization for sensitive endpoints

## License

See main project README for license information.
