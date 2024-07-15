import axiosInstance from "src/utils/axiosInstance";
import Cookies from "js-cookie";
const verifyOTP = async (data) => {
  return axiosInstance
    .post("/account/login_with_otp/", data)
    .then((response) => {
      Cookies.set("access_token", response.data.body.access_token, {
        expires: 1,
      });
      Cookies.set("refresh_token", response.data.body.refresh_token, {
        expires: 2,
      });
      return response.data;
    })

    .catch((error) => {
      throw error.response ? error.response.data : error;
    });
};

export default verifyOTP;
