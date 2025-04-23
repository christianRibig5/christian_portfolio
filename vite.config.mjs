import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
  plugins: [react()],
  base: '/', // ✅ do NOT add a subdirectory or ./ — just "/"
  build: {
    outDir: 'dist',
  },
});