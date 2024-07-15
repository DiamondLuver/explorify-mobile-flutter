import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App.jsx";
import "./index.css";
import { GoogleOAuthProvider } from "@react-oauth/google";
// const isLoading = useLoading();
ReactDOM.createRoot(document.getElementById("root")).render(
  // <GoogleOAuthProvider clientId={process.env.APP_GOOGLE_CLIENT_ID}>
  <React.StrictMode>
      <App />
  </React.StrictMode>
  // </GoogleOAuthProvider>
);
