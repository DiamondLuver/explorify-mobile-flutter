import axios from 'axios';
const axiosInstance = axios.create({
    baseURL: process.env.BASE_API_URL ,
});

axiosInstance.interceptors.response.use(
    (response) => response,
    async (error) => {
        const originalRequest = error.config;

        if (typeof error.response === "undefined") {
            alert("A server error occurred. We will fix it shortly.");
            return Promise.reject(error);
        }

        if (error.response.status === 401 && !localStorage.getItem("refresh_token")) {
            window.location.href = "/login/";
            return Promise.reject(error);
        }

        if (
            error.response.status === 401 &&
            error.response.statusText === "Unauthorized" &&
            localStorage.getItem("refresh_token") !== undefined
        ) {
            const refreshToken = localStorage.getItem("refresh_token");

            return axiosInstance
                .post("/auth/token", {
                    client_id: process.env.APP_CLIENT_ID,   
                    client_secret: process.env.APP_CLIENT_ID ,
                    grant_type: "refresh_token",
                    refresh_token: refreshToken,
                })
                .then((response) => {
                    localStorage.setItem("access_token", response.data.access_token);
                    localStorage.setItem("refresh_token", response.data.refresh_token);

                    axiosInstance.defaults.headers["Authorization"] =
                        "Bearer " + response.data.access_token;

                    originalRequest.headers["Authorization"] =
                        "Bearer " + response.data.access_token;

                    return axiosInstance(originalRequest);
                })
                .catch((err) => {
                    console.log(err);
                });
        }

        return Promise.reject(error);
    }
);

export default axiosInstance;
