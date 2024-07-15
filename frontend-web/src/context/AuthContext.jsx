import React, { createContext, useContext, useEffect, useState , useMemo} from 'react';
import Cookies from 'js-cookie';
import { useNavigate } from 'react-router-dom';
import axiosInstance from 'src/utils/axiosInstance';
const AuthContext = createContext();

export const AuthProvider = ({ children }) => {
  const [isAuthenticated, setIsAuthenticated] = useState(false);
  // const [accessToken, setAccessToken_] = useState(Cookies.get("access_token"));
  // const setAccessToken = (newToken) => {
  //   setAccessToken_(newToken);
  // };
  const navigate = useNavigate();

  useEffect(() => {
    const accessToken = Cookies.get('access_token');

    if (accessToken) {
      setIsAuthenticated(true);
      axiosInstance.defaults.headers.common["Authorization"] = "Bearer " + accessToken;
      // Cookies.set('access_token',accessToken);
      // navigate('/');
    } else {
      setIsAuthenticated(false);
      delete axiosInstance.defaults.headers.common["Authorization"];
      Cookies.remove('access_token');
      const path = window.location.pathname;
      if (path != '/login' & path !='/otp' & path != '/register') {
        navigate('/login');
      }
    }
  }, [navigate]);
  // const contextValue = useMemo(
  //   () => ({
  //     accessToken,
  //     setAccessToken,
  //     isAuthenticated,
  //     setIsAuthenticated,
  //   }),
  //   [accessToken, isAuthenticated]
  // );
  return (
    <AuthContext.Provider value={{isAuthenticated, setIsAuthenticated}}>
      {children}
    </AuthContext.Provider>
  );
};

export const useAuth = () => useContext(AuthContext);
