import axios from "axios";
import Cookies from "js-cookie";

const axiosInstance = axios.create({
  baseURL: process.env.BASE_API_URL,      // http://localhost:8989/api/v1/
  headers: {
    "Content-Type": "application/json",
  },
});

export const setupAxiosInterceptors = (navigate) => {
  axiosInstance.interceptors.request.use(
    (config) => {
      const accessToken = Cookies.get("access_token");
      if (
        accessToken &&
        !config.url.includes("/login") &&
        !config.url.includes("/register")
      ) {
        config.headers.Authorization = `Bearer ${accessToken}`;
      }
      return config;
    },
    (error) => Promise.reject(error)
  );

  axiosInstance.interceptors.response.use(
    (response) => response,
    async (error) => {

      return Promise.reject(error);
    }
  );
};

export default axiosInstance;
