import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';

const Edit = ({ companyId }) => {
  const navigate = useNavigate();

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
  const [showModal, setShowModal] = useState(false);

  useEffect(() => {
    const fetchCompanyData = async () => {
      try {
        const response = await axios.get(`http://localhost:8989/api/v1/company/details/${companyId}/`);
        setCompanyData(response.data);
      } catch (error) {
        console.error('Error fetching company data:', error);
      }
    };

    fetchCompanyData();
  }, [companyId]);

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
      const res = await axios.put(`http://localhost:8989/api/v1/company/update/${companyId}/`, formData, {
        headers: { 'Content-Type': 'multipart/form-data' }, // Use multipart/form-data for file uploads
      });

      setMessage('Company updated successfully');
      setLoading(false);
      toggleModal(); // Close modal after successful update
      navigate('/company/profile'); // Redirect to profile page after update
    } catch (err) {
      console.error('Error updating company data:', err);
      setMessage(
        err.response?.status === 404
          ? 'Validation failed or resource not found'
          : `Something went wrong: ${err.response?.data?.message || err.message}`
      );
      setLoading(false);
    }
  };

  // Function to toggle modal visibility
  const toggleModal = () => {
    setShowModal(!showModal);
  };

  return (
    <>
      {/* Edit button/link */}
      <button
        onClick={toggleModal}
        className="block text-white bg-amber-500 hover:bg-amber-600 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
        type="button"
      >
        Edit
      </button>

      {/* Modal */}
      {showModal && (
        <div className="fixed top-0 left-0 w-full h-full  flex items-center justify-center bg-gray-800 bg-opacity-75 z-50">
          <div className="bg-white p-8 rounded-lg shadow-lg w-full  max-w-2xl  h-full md:h-auto">
            
          <div class="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
          <h3 className="text-lg font-semibold text-gray-900 ">Update Company</h3>
          <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" onClick={toggleModal} >
                    <svg aria-hidden="true" class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fill-rule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clip-rule="evenodd"></path></svg>
                    <span class="sr-only">Close modal</span>
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
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
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
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
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
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
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
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
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
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      placeholder="flowbite.com"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="number" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Number of employees
                    </label>
                    <input
                      type="number"
                      name="employee_size"
                      value={companyData.employee_size}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      placeholder="10-50"
                      required
                    />
                  </div>

                  <div>
                    <label htmlFor="location" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                      Location
                    </label>
                    <input
                      type="text"
                      name="location"
                      value={companyData.location}
                      onChange={handleChange}
                      className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                      placeholder="New York"
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
                    className="bg-gray-50 border border-gray-300 font-normal text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
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
                    className="mt-5 text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                    disabled={loading}
                  >
                    {loading ? 'Submitting...' : 'Submit'}
                  </button>
                </div>
              </form>
            {message && <p className="mt-4 text-sm text-red-500">{message}</p>}
          
          </div>
        </div>
      )}
    </>
  );
};

export default Edit;





















