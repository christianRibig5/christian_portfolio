import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: '/', // required for Amplify
  build: {
    outDir: 'dist', // should match amplify.yml
  },
});