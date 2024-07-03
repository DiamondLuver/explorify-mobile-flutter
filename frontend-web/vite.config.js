import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";
// import dotenv from 'dotenv';

// dotenv.config();    
export default defineConfig({
 base: "/",
 plugins: [react()],
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
});     