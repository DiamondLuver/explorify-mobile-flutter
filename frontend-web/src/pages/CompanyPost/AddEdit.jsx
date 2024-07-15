import axios from 'axios';
import React, { useState } from 'react';

const AddEdit = () => {
  const [companyData, setCompanyData] = useState({
    company_name: '',
    location: '',
    description: '',
    head_office: '',
    employee_size: '',
    company_type: '',
    specialization: '',
    company_website: '',
    company_pic: '',
  });
  const [message, setMessage] = useState(null);
  const [loading, setLoading] = useState(false);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCompanyData((prevState) => ({ ...prevState, [name]: value }));
  };

  const handleFileChange = (event) => {
    setCompanyData({
      ...companyData,
      company_pic: event.target.files[0], // Set the selected file
    });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMessage(null);

    const formData = new FormData();
    Object.keys(companyData).forEach((key) => {
      formData.append(key, companyData[key]);
    });

    try {
      const res = await axios.post('http://localhost:8989/api/v1/company/create/', formData, {
        headers: { 'Content-Type': 'multipart/form-data' },
      });

      setMessage(`Company added successfully: ${JSON.stringify(res.data)}`);
      setLoading(false);

      // Optionally clear form fields after successful submission
      setCompanyData({
        company_name: '',
        location: '',
        description: '',
        head_office: '',
        employee_size: '',
        company_type: '',
        specialization: '',
        company_website: '',
        company_pic: '',
      });
    } catch (err) {
      console.error(err); // Log the error to the console for debugging
      setMessage(
        err.response?.status === 404
          ? 'Validation failed or resource not found'
          : `Something went wrong: ${err.response?.data?.message || err.message}`
      );
      setLoading(false);
    }
  };


  return (
    <>
      <button
        type="button"
        id="defaultModalButton"
        data-modal-target="defaultModal"
        data-modal-toggle="defaultModal"
        className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-[#F27C1C] hover:bg-[#ce6918] dark:bg-primary-600 dark:hover:bg-primary-700"
      >
        <svg
          className="h-3.5 w-3.5 mr-2"
          fill="currentColor"
          viewBox="0 0 20 20"
          xmlns="http://www.w3.org/2000/svg"
          aria-hidden="true"
        >
          <path
            clipRule="evenodd"
            fillRule="evenodd"
            d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z"
          />
        </svg>
        Add new
      </button>

      <div>
        <div
          id="defaultModal"
          tabIndex={-1}
          aria-hidden="true"
          className="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full"
        >
          <div className="relative p-4 w-full max-w-2xl h-full md:h-auto">
            <div className="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
              <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
                <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
                  ADD
                </h3>
                <button
                  type="button"
                  className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                  data-modal-toggle="defaultModal"
                >
                  <svg
                    aria-hidden="true"
                    className="w-5 h-5"
                    fill="currentColor"
                    viewBox="0 0 20 20"
                    xmlns="http://www.w3.org/2000/svg"
                  >
                    <path
                      fillRule="evenodd"
                      d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z"
                      clipRule="evenodd"
                    />
                  </svg>
                  <span className="sr-only">Close modal</span>
                </button>
              </div>

              <form onSubmit={handleSubmit}>
                <div className="grid gap-4 mb-4 sm:grid-cols-2">
                  <div>
                    <label htmlFor="name" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Name
                    </label>
                    <input
                      type="text"
                      name="company_name"
                      value={companyData.company_name}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="Company name"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Head office
                    </label>
                    <input
                      type="text"
                      name="head_office"
                      value={companyData.head_office}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="Los Angeles"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Industry
                    </label>
                    <input
                      type="text"
                      name="company_type"
                      value={companyData.company_type}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="Public"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Specialization
                    </label>
                    <input
                      type="text"
                      name="specialization"
                      value={companyData.specialization}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="Manager team"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="link" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Website
                    </label>
                    <input
                      type="link"
                      name="company_website"
                      value={companyData.company_website}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="www.hello.com"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="number" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Employee size
                    </label>
                    <input
                      type="number"
                      name="employee_size"
                      value={companyData.employee_size}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="10-50"
                      required
                    />
                  </div>

                  
                </div>
                <div className="grid gap-4 mb-4 sm:grid-cols-1">
                <div>
                    <label htmlFor="location" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Location
                    </label>
                    <input
                      type="text"
                      name="location"
                      value={companyData.location}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder="2nd Bridge Prek Leap, National Road Number 6, Phnom Penh, 12252, កម្ពុជា ·"
                      required
                    />
                  </div>
                </div>
                <div className="sm:col-span-2">
                  <label htmlFor="description" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                    Description
                  </label>
                  <textarea
                    id="description"
                    rows={4}
                    name="description"
                    value={companyData.description}
                    onChange={handleChange}
                    className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                    placeholder="Write description here"
                  ></textarea>
                </div>

                <input type="file" name="company_pic" onChange={handleFileChange} />


                {message && (
                  <div className="mt-4">
                    <p
                      className={`text-sm ${message.includes('successfully') ? 'text-green-500' : 'text-red-500'}`}
                    >
                      {message}
                    </p>
                  </div>
                )}

                <div className="flex items-center space-x-4">
                  <button
                    type="submit"
                    className="mt-3 text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                    disabled={loading}
                  >
                    {loading ? 'Submitting...' : 'Submit'}
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
    </>
  );
};

export default AddEdit;
