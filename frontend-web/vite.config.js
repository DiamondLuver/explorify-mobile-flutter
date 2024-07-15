import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// Optional: Load environment variables from a custom .env file
import { loadEnv } from 'vite';

export default defineConfig(({ mode }) => {
  const env = loadEnv(mode, process.cwd());

  return {
    base: "/",
    plugins: [react()],
    resolve: {
      alias: {
        src: "/src",
      },
    },
    define: {
      'process.env': env
    },
    preview: {
      port: 8080,
      strictPort: true,
    },
    server: {
      port: 8080,
      strictPort: true,
      host: true,
      origin: "http://0.0.0.0:8080",
    },
  };
});
