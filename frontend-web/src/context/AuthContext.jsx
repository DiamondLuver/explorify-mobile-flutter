import React, { createContext, useContext, useEffect, useState } from "react";
import Cookies from "js-cookie";
import { useNavigate } from "react-router-dom";
import axiosInstance from "src/utils/axiosInstance";

const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  const navigate = useNavigate();

  useEffect(() => {
    const checkAuth = async () => {
      const accessToken = Cookies.get("access_token");
      const refreshToken = Cookies.get("refresh_token");

      if (accessToken) {
        setIsAuthenticated(true);
        axiosInstance.defaults.headers.common["Authorization"] = `Bearer ${accessToken}`;
      } else if (refreshToken) {
        try {
          const response = await axiosInstance.post("auth/token", {
            client_id: process.env.VITE_APP_CLIENT_ID,
            client_secret: process.env.VITE_APP_CLIENT_SECRET,
            grant_type: "refresh_token",
            refresh_token: refreshToken,
          });

          setIsAuthenticated(true);
          Cookies.set("access_token", response.data.access_token);
          Cookies.set("refresh_token", response.data.refresh_token);
          axiosInstance.defaults.headers.common["Authorization"] = `Bearer ${response.data.access_token}`;
        } catch (err) {
          console.error(err);
          handleLogout();
        }
      } else {
        handleLogout();
      }
    };

    checkAuth();
  }, [navigate]);

  const handleLogout = () => {
    setIsAuthenticated(false);
    delete axiosInstance.defaults.headers.common["Authorization"];
    Cookies.remove("access_token");
    Cookies.remove("refresh_token");
    
    navigate("/login");
  };

  return (
    <AuthContext.Provider value={{ isAuthenticated, setIsAuthenticated }}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
