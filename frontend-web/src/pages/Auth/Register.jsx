// src/auth/Register.js
import { useState } from "react";
import ErrorMessage from "src/components/SmallComponents/ErrorMessage";
import SuccessMessage from "src/components/SmallComponents/SuccessMessage";
import registerUser from "src/pages/Auth/ApiService/registerService";
import { useLoading } from "src/context/LoadingContext";
import { Helmet } from "react-helmet";
const Register = () => {
  const [formData, setFormData] = useState({
    username: "",
    email: "",
    password: "",
    company_name: "",
    description: "",
    location: "",
    head_office: "",
    employee_size: "",
    company_type: "",
    specialization: "",
    company_website: "",
  });

  const handleChange = (e) => {
    setFormData({
      ...formData,
      [e.target.name]: e.target.value,
    });
  };
  const [successMessage, setSuccessMessage] = useState("");
  const [errorMessage, setErrorMessage] = useState("");
  const { showLoading, hideLoading } = useLoading();
  const handleSubmit = async (e) => {
    e.preventDefault();
    showLoading();
    try {
      const response = await registerUser(formData);
      setSuccessMessage(
        "Company profile registration is submitted and pending approval."
      );
      console.log("User registered successfully:", response);
    } catch (error) {
      setErrorMessage(error.response.data.result_message);
      console.error("Error registering user:", error);
    } finally {
      hideLoading();
    }
  };

  return (
    <>
      <Helmet>
        <title>Register Company - Explorify</title>
      </Helmet>
      <div className="relative min-h-screen flex items-center justify-center bg-[#F27C1C]">
        <div className="absolute inset-0 bg-gradient-to-b from-[#f7ac70] via-[#F27C1C] to-[#F27C1C] h-full w-full"></div>
        <div className="relative flex flex-col sm:flex-row lg:w-2/3 md:w-2/3 sm:w-4/5 items-center justify-center bg-transparent rounded-3xl">
          <div className="hidden lg:flex flex-col self-center p-10 max-w-md text-white z-10 pb-60 pr-20">
            <img
              src="https://www.creativefabrica.com/wp-content/uploads/2021/03/20/Mountain-logo-Design-Graphics-9785421-1-580x435.png"
              alt="Logo"
              className="w-64"
            />
            <h1 className="mb-3 font-semibold text-4xl">Welcome back</h1>
            <p className="pr-3 text-sm opacity-75">
              Lorem ipsum is placeholder text commonly used in the graphic,
              print, and publishing industries for previewing layouts and visual
              mockups.
            </p>
          </div>
          <div className="flex justify-center self-center z-10 my-10 p-10 bg-white rounded-3xl w-full sm:w-4/5 lg:w-3/4 xl:w-2/3">
            <div className="w-full">
              <div className="mb-6">
                <h3 className="font-semibold text-2xl text-gray-800">
                  Register account
                </h3>
                <p className="text-gray-400 pt-2">Fill your details</p>
              </div>
              {successMessage ? (
                <SuccessMessage message={successMessage} />
              ) : errorMessage ? (
                <ErrorMessage message={errorMessage} />
              ) : null}
              <br></br>
              <form
                className="space-y-6"
                enctype="multipart/form-data"
                onSubmit={handleSubmit}
              >
                <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label
                      htmlFor="username"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Username<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="username"
                      id="username"
                      autoComplete="username"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.username}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="email"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Email<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="email"
                      name="email"
                      id="email"
                      autoComplete="email"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.email}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="password"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Password<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="password"
                      name="password"
                      id="password"
                      autoComplete="new-password"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.password}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="company_name"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Company Name<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="company_name"
                      id="company_name"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.company_name}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="description"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Description<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="description"
                      id="description"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.description}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="location"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Location<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="location"
                      id="location"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.location}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="head_office"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Head Office<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="head_office"
                      id="head_office"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.head_office}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="employee_size"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Employee Size<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="number"
                      name="employee_size"
                      id="employee_size"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.employee_size}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="company_type"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Company Type<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="company_type"
                      id="company_type"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.company_type}
                      onChange={handleChange}
                    />
                  </div>
                  <div>
                    <label
                      htmlFor="specialization"
                      className="block mb-2 text-sm font-medium text-gray-900"
                    >
                      Specialization<span className="text-[#F27C1C]"> *</span>
                    </label>
                    <input
                      type="text"
                      name="specialization"
                      id="specialization"
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      required
                      value={formData.specialization}
                      onChange={handleChange}
                    />
                  </div>
                </div>
                <div>
                  <label
                    htmlFor="company_website"
                    className="block mb-2 text-sm font-medium text-gray-900"
                  >
                    Company Website<span className="text-[#F27C1C]"> *</span>
                  </label>
                  <input
                    type="url"
                    name="company_website"
                    id="company_website"
                    className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                    required
                    value={formData.company_website}
                    onChange={handleChange}
                  />
                </div>

                <button
                  type="submit"
                  className="w-full text-white bg-[#F27C1C] hover:bg-[#ce6918] font-medium rounded-lg text-sm px-5 py-2.5 text-center"
                >
                  Register
                </button>
                <p className="text-sm font-light text-gray-500">
                  Already have an account?{" "}
                  <a
                    href="/login"
                    className="font-medium text-primary-600 hover:underline"
                  >
                    Login here
                  </a>
                </p>
              </form>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default Register;
