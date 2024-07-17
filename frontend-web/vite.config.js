import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
import dotenv from 'dotenv';
dotenv.config();
export default defineConfig(({ mode }) => {

  return {
    base: "/",
    plugins: [react()],
    resolve: {
      alias: {
        src: "/src",
      },
    },
    define: {
      'process.env': process.env
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
