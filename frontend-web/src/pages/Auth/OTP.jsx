import Cookies from "js-cookie";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";
import SuccessMessage from "src/components/SmallComponents/SuccessMessage";
import { useLoading } from "src/context/LoadingContext";
import verifyOTP from "src/pages/Auth/ApiService/otpService";
import ErrorMessage from "src/components/SmallComponents/ErrorMessage";
import { Helmet } from "react-helmet";

const OTP = () => {
  const username_or_email = Cookies.get("username_or_email");
  const [code, setCode] = useState("");
  const [timeLeft, setTimeLeft] = useState(10);
  const [errorMessage, setErrorMessage] = useState("");
  const [successMessage, setSuccessMessage] = useState("");
  const { showLoading, hideLoading } = useLoading();
  const navigate = useNavigate();
  const otp_send = localStorage.getItem("code");
  const handleChange = (e) => {
    setCode(e.target.value);
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    showLoading();

    verifyOTP({ code, username_or_email })
      .then((response) => {
        setSuccessMessage("Logged in successfully");
        console.log("User logged in successfully:", response);
        // setIsAuthenticated(true);
        setTimeout(() => {
          navigate("/");
        }, 2000);
      })
      .catch((error) => {
        console.error("Error logging in user:", error);
        setErrorMessage("Failed to verify OTP");
      })
      .finally(() => {
        hideLoading();
      });
  };
  // Start the timer
  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft((prevTime) => {
        if (prevTime <= 1) {
          clearInterval(timer);
          return 0;
        }
        return prevTime - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, []);

  return (
    <>
    <Helmet>
      <title>OTP Login - Explorify</title>
    </Helmet>
      <div className="relative min-h-screen flex items-center justify-center bg-[#F27C1C]">
        <div className="relative flex flex-col sm:flex-row items-center justify-center bg-transparent rounded-3xl">
          <div className="flex justify-center self-center z-10 p-10 bg-white rounded-3xl w-full sm:w-96">
            <div className="w-full">
              {successMessage ? (
                <SuccessMessage message={successMessage} />
              ) : errorMessage ? (
                <ErrorMessage message={errorMessage} />
              ) : null}
              <h3 className="font-semibold text-2xl text-gray-800">
                Enter OTP
              </h3>
              <p className="text-gray-400 pt-2">
                Please enter the OTP sent to your email.
              </p>

              <p>Code: {otp_send}</p>
              <form className="space-y-6" onSubmit={handleSubmit}>
                <div>
                  <label
                    htmlFor="code"
                    className="block mb-2 text-sm font-medium text-gray-900"
                  ></label>
                  <input
                    type="text"
                    name="code"
                    id="code"
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                    placeholder="Enter OTP"
                    value={code}
                    onChange={handleChange}
                    required
                  />
                </div>

                <button
                  type="submit"
                  className="w-full text-white bg-[#F27C1C] hover:bg-[#ce6918] font-medium rounded-lg text-sm px-5 py-2.5 text-center"
                >
                  Verify OTP
                </button>
              </form>
              <div className="text-gray-600 mt-4">
                {timeLeft > 0 ? (
                  <p>
                    Time remaining: {Math.floor(timeLeft / 60)}:
                    {timeLeft % 60 < 10 ? `0${timeLeft % 60}` : timeLeft % 60}
                  </p>
                ) : (
                  <div>
                    <p>OTP expired. Please request a new one.</p>
                    <a
                      href="/login"
                      className="font-medium text-[#F27C1C] hover:underline"
                    >
                      Login Again
                    </a>
                  </div>
                )}
              </div>
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

export default OTP;
