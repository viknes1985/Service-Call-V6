import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react'; // Or your specific framework plugin

export default defineConfig({
  plugins: [react()],
  server: {
    // 1. Listen on all addresses so Fly.io can find the app
    host: '0.0.0.0', 
    
    // 2. Match the port you set in fly.toml and Dockerfile
    port: 3000, 
    
    // 3. THE FIX: Trust the Fly.io domain to stop the "Blocked Request" error
    allowedHosts: [
      'service-call.fly.dev',
      '.fly.dev' // This allows any sub-domain under fly.dev
    ],

    // 4. Ensure HMR (Hot Module Replacement) works over HTTPS if needed
    hmr: {
      clientPort: 443,
    },
  },
  build: {
    outDir: 'dist/client', // Useful to keep client and server builds separate
  }
});