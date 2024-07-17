import Cookies from "js-cookie";
import { useState } from "react";
import ErrorMessage from "src/components/SmallComponents/ErrorMessage";
import SuccessMessage from "src/components/SmallComponents/SuccessMessage";
import { useLoading } from "src/context/LoadingContext";
import loginUser from "src/pages/Auth/ApiService/loginService";
import OTP from "src/pages/Auth/OTP";
import { Helmet } from "react-helmet";
const Login = () => {
  const { showLoading, hideLoading } = useLoading();
  
  const [formData, setFormData] = useState({
    username_or_email: "",
    password: "",
  });
  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };

  const [successMessage, setSuccessMessage] = useState("");
  const [isLoggedIn, setIsLoggedIn] = useState(false); // Track login state
  const [errorMessage, setErrorMessage ] = useState("");
  const handleSubmit = async (e) => {
    e.preventDefault();
    showLoading();

    try {
      const response = await loginUser(formData);
      const usernameOrEmail = response.body.username_or_email;

      // Set username_or_email in a cookie
      Cookies.set("username_or_email", usernameOrEmail, { expires: 1 });
      setSuccessMessage("OTP Code Sent Successfully");

      // Update login state
      setIsLoggedIn(true);
      hideLoading();
    } catch (error) {
      hideLoading();
      console.error("Error logging in user:", error);
      setErrorMessage("Failed to Logged in");
    }
  };

  // Render the OTP component if logged in
  if (isLoggedIn) {
    return <OTP />;
  }

  return (
    <>
    <Helmet>
      <title>Login - Explorify</title>
    </Helmet>
      <div className="relative min-h-screen flex items-center justify-center bg-[#F27C1C]">
        <div className="absolute inset-0 bg-gradient-to-b from-[#f7ac70] via-[#F27C1C] to-[#F27C1C] h-full w-full"></div>
        <div className="relative flex flex-col sm:flex-row items-center justify-center bg-transparent rounded-3xl ">
          <div className="hidden lg:flex flex-col self-center p-10 max-w-md text-white z-10 pb-60 pr-20">
            <img src="../assets/app_logo.png" alt="Logo" className="w-32 " />
            <h1 className="mb-3 font-semibold text-4xl">Welcome back</h1>
            <p className="pr-3 text-sm opacity-75">
              Lorem ipsum is placeholder text commonly used in the graphic,
              print, and publishing industries for previewing layouts and visual
              mockups.
            </p>
          </div>

          <div className="flex justify-center self-center z-10 p-10 bg-white rounded-3xl w-full sm:w-96">
            <div className="w-full">
              <div className="mb-6">
                <h3 className="font-semibold text-2xl text-gray-800">
                  Login to your account
                </h3>
                <p className="text-gray-400 pt-2">Welcome Back !!</p>
              </div>
              {successMessage ? (
              <SuccessMessage message={successMessage} />
            ) : errorMessage ? (
              <ErrorMessage message={errorMessage} />
            ) : null}
            <br></br>
              <form
                className="space-y-6"
                encType="multipart/form-data"
                onSubmit={handleSubmit}
              >
                <div>
                  <label
                    htmlFor="username_or_email"
                    className="block mb-2 text-sm font-medium text-gray-900"
                  >
                    Enter email
                  </label>
                  <input
                    type="text"
                    name="username_or_email"
                    id="username_or_email"
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                    placeholder="name@company.com"
                    value={formData.username_or_email}
                    onChange={handleChange}
                    required
                  />
                </div>
                <div>
                  <label
                    htmlFor="password"
                    className="block mb-2 text-sm font-medium text-gray-900"
                  >
                    Password
                  </label>
                  <input
                    type="password"
                    name="password"
                    id="password"
                    placeholder="••••••••"
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                    value={formData.password}
                    onChange={handleChange}
                    required
                  />
                </div>
                <div className="flex items-center justify-between">
                  <div className="flex items-start">
                    <div className="flex items-center h-5">
                      <input
                        id="remember"
                        type="checkbox"
                        className="w-4 h-4 border border-gray-300 rounded bg-gray-50 focus:ring-3 focus:ring-[#f7ac70]"
                      />
                    </div>
                    <div className="ml-3 text-sm">
                      <label htmlFor="remember" className="text-gray-500">
                        Remember me
                      </label>
                    </div>
                  </div>
                  <a
                    href="/"
                    className="text-sm font-medium text-[#F27C1C] hover:underline"
                  >
                    Forgot password?
                  </a>
                </div>
                <button
                  type="submit"
                  className="w-full text-white bg-[#F27C1C] hover:bg-[#ce6918]  font-medium rounded-lg text-sm px-5 py-2.5 text-center"
                >
                  Sign in
                </button>
                <p className="text-sm font-light text-gray-500">
                  Don’t have an account yet?{" "}
                  <a
                    href="/register"
                    className="font-medium text-[#F27C1C] hover:underline"
                  >
                    Sign up
                  </a>
                </p>
              </form>
            </div>
          </div>
        </div>
        <svg
          className="absolute bottom-0 left-0 w-full"
          xmlns="http://www.w3.org/2000/svg"
          viewBox="0 0 1440 320"
        >
          <path
            fill="#fff"
            fillOpacity="1"
            d="M0,0L40,42.7C80,85,160,171,240,197.3C320,224,400,192,480,154.7C560,117,640,75,720,74.7C800,75,880,117,960,154.7C1040,192,1120,224,1200,213.3C1280,203,1360,149,1400,122.7L1440,96L1440,320L1400,320C1360,320,1280,320,1200,320C1120,320,1040,320,960,320C880,320,800,320,720,320C640,320,560,320,480,320C400,320,320,320,240,320C160,320,80,320,40,320L0,320Z"
          ></path>
        </svg>
      </div>
    </>
  );
};

export default Login;
