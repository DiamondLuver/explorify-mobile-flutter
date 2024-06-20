
import axios from 'axios';

const axiosInstance = axios.create({
    baseURL: process.env.BASE_API_URL
});

export default axiosInstance;