import axiosInstance from "../utils/axiosInstance";
export function googleLogin(accessToken) {
  axiosInstance
    .post(`/auth/convert-token`, {
      token: accessToken,
      backend: "google-oauth2",
      grant_type: "convert_token",
      client_id: process.env.APP_CLIENT_ID,
      client_secret: process.env.APP_CLIENT_SECRET,
    })
    .then((res) => {
      // Save somewhere these access and refresh tokens
      localStorage.setItem("access_token", res.data.access_token);
      localStorage.setItem("refresh_token", res.data.refresh_token);
      console.log(res.data);
    });
}
