import axios from 'axios';
import React, { useState, useEffect } from 'react';

const UpdateProfile = () => {
  const [companyData, setCompanyData] = useState({
    company_id: '',
    company_name: '',
    location: '',
    description: '',
    head_office: '',
    employee_size: '',
    company_type: '',
    specialization: '',
    company_website: '',
  });

  const [message, setMessage] = useState(null);

  useEffect(() => {
    const fetchCompanyData = async () => {
      try {
        const { data } = await axios.get(`http://localhost:8989/api/company/${companyData.company_id}`);
        setCompanyData(data);
      } catch (err) {
        setMessage('Error fetching company data');
      }
    };

    if (companyData.company_id) {
      fetchCompanyData();
    }
  }, [companyData.company_id]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCompanyData({ ...companyData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      const res = await axios.put(`http://localhost:8989/api/company/update/${companyData.company_id}`, companyData, {
        headers: { 'Content-Type': 'application/json' },
      });
      setMessage(`Company updated successfully: ${JSON.stringify(res.data)}`);
    } catch (err) {
      setMessage(err.response?.status === 404
        ? 'Validation failed or resource not found'
        : 'Something went wrong');
    }
  };

  document.addEventListener("DOMContentLoaded", function(event) {
    document.getElementById('updateProductButton').click();
  });

  return (
    <>
      <button id="updateProductButton" data-modal-target="updateProductModal" data-modal-toggle="updateProductModal" className="block text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800" type="button">
        Update product
      </button>

      <div id="updateProductModal" tabIndex={-1} aria-hidden="true" className="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
        <div className="relative p-4 w-full max-w-2xl h-full md:h-auto">
          <div className="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
            <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
              <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
                Update Product
              </h3>
              <button type="button" className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="updateProductModal">
                <svg aria-hidden="true" className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fillRule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clipRule="evenodd" /></svg>
                <span className="sr-only">Close modal</span>
              </button>
            </div>
            <form onSubmit={handleSubmit}>
              <div className="grid gap-4 mb-4 sm:grid-cols-2">
                {[
                  { label: "Name", name: "company_name", placeholder: "Company name", type: "text" },
                  { label: "Head office", name: "head_office", placeholder: "Los Angeles", type: "text" },
                  { label: "Industry", name: "company_type", placeholder: "Public", type: "text" },
                  { label: "Specialization", name: "specialization", placeholder: "Manager team", type: "text" },
                  { label: "Website", name: "company_website", placeholder: "www.hello.com", type: "text" },
                  { label: "Employee size", name: "employee_size", placeholder: "Number of employees", type: "number" },
                  { label: "Address", name: "location", placeholder: "Company location", type: "text" }
                ].map((field, index) => (
                  <div key={index}>
                    <label htmlFor={field.name} className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      {field.label}
                    </label>
                    <input
                      type={field.type}
                      name={field.name}
                      value={companyData[field.name]}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                      placeholder={field.placeholder}
                      required
                    />
                  </div>
                ))}
                <div className="sm:col-span-2">
                  <label htmlFor="description" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Description</label>
                  <textarea
                    id="description"
                    name="description"
                    value={companyData.description}
                    onChange={handleChange}
                    rows={4}
                    className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-[#f7ac70] focus:border-[#f7ac70] dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                    placeholder="Write company description here"
                    required
                  />
                </div>
              </div>
              <button
                type="submit"
                className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-[#F27C1C] hover:bg-[#ce6918]"
              >
                <svg
                  className="mr-1 -ml-1 w-6 h-6"
                  fill="currentColor"
                  viewBox="0 0 20 20"
                  xmlns="http://www.w3.org/2000/svg"
                >
                  <path
                    fillRule="evenodd"
                    d="M10 5a1 1 0 011 1v3h3a1 1 0 110 2h-3v3a1 1 0 11-2 0v-3H6a1 1 0 110-2h3V6a1 1 0 011-1z"
                    clipRule="evenodd"
                  />
                </svg>
                Add new product
              </button>
              {message && <p>{message}</p>}
            </form>
          </div>
        </div>
      </div>
    </>
  );
};

export default UpdateProfile;
