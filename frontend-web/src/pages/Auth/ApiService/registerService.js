// authService.js
import axiosInstance from "src/utils/axiosInstance";

const registerUser = async (userData) => {
  return await axiosInstance
    .post("account/create-company/", userData)
    .then((response) => {
      return response.data;
    })
    .catch((error) => {
      throw error;
    });
};

export default registerUser;
