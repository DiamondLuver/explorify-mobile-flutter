import axiosInstance from "src/utils/axiosInstance";
const loginUser = async (userData) => {
  try {
    const response = await axiosInstance.post(`account/generate/`, userData);
    localStorage.setItem("code", response.data.body.code);
    return response.data;
  } catch (error) {
    throw error;
  }
};

export default loginUser;
