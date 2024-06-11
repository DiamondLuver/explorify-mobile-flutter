import axios from 'axios';
import React, { useEffect, useState } from 'react';


const AddEdit= ({ existingCompany }) => {
  const [isEditMode, setIsEditMode] = useState(false);
  const [companyData, setCompanyData] = useState({
    company_id: existingCompany?.company_id || '',
    company_name: existingCompany?.company_name || '',
    location: existingCompany?.location || '',
    description: existingCompany?.description || '',
    head_office: existingCompany?.head_office || '',
    employee_size: existingCompany?.employee_size || '',
    company_type: existingCompany?.company_type || '',
    specialization: existingCompany?.specialization || '',
    company_website: existingCompany?.company_website || '',
  });

  const [message, setMessage] = useState(null);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setCompanyData({ ...companyData, [name]: value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    try {
      if (isEditMode) {
        // Edit operation
        const res = await axios.put(`http://localhost:8989/api/company/${companyId}`, companyData, {
          headers: { 'Content-Type': 'application/json' },
        });
        setMessage(`Company updated successfully: ${JSON.stringify(res.data)}`);
      } else {
        // Add operation
        const res = await axios.post('http://localhost:8989/api/company/create/', companyData, {
          headers: { 'Content-Type': 'application/json' },
        });
        setMessage(`Company added successfully: ${JSON.stringify(res.data)}`);
      }
    } catch (err) {
      setMessage(err.response?.status === 404
        ? 'Validation failed or resource not found'
        : 'Something went wrong');
    }
  };
  return (
    
    <>
    

    <button type="button"  id='defaultModalButton' data-modal-target="defaultModal" data-modal-toggle="defaultModal" className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-[#F27C1C] hover:bg-[#ce6918]  dark:bg-primary-600 dark:hover:bg-primary-700 ">
      <svg className="h-3.5 w-3.5 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path clipRule="evenodd" fillRule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" />
      </svg>
      Add new
    </button>



   

{/*  For add new component */}

<div>
  {/* Main modal */}
  <div id="defaultModal" tabIndex={-1} aria-hidden="true" className="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-modal md:h-full">
    <div className="relative p-4 w-full max-w-2xl h-full md:h-auto">
      {/* Modal content */}
      <div className="relative p-4 bg-white rounded-lg shadow dark:bg-gray-800 sm:p-5">
        {/* Modal header */}
        <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b sm:mb-5 dark:border-gray-600">
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
            {isEditMode ? 'Edit Company Profile' : 'Add Company Profile'}
          </h3>
          <button type="button" className="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-toggle="defaultModal">
            <svg aria-hidden="true" className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><path fillRule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clipRule="evenodd" /></svg>
            <span className="sr-only">Close modal</span>
          </button>
        </div>
        {/* Modal body */}
    <form action='' onSubmit={handleSubmit}>
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
            placeholder="Los angeles"
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
            placeholder="public"
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
            placeholder="mananger team"
            required
          />
        </div>

        <div>
        <label htmlFor="link" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
            Webiste
          </label>
          <input
            type="link"
            name="company_website"
            value={companyData.company_website}
            onChange={handleChange}
            className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="www.helllo.com"
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
            placeholder="Company location"
            required
          />
        </div>


        <div>
          <label htmlFor="text" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
            Address
          </label>
          <input
            type="text"
            name="location"
            value={companyData.location}
            onChange={handleChange}
            className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Company location"
            required
          />
        </div>
        
        <div className="sm:col-span-2">
          <label htmlFor="description" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
            Description
          </label>
          <textarea
            id="description"
            name="description"
            value={companyData.description}
            onChange={handleChange}
            rows={4}
            className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-[#f7ac70] focus:border-[#f7ac70] dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
            placeholder="Write product description here"
          />
        </div>
      </div>
      <button
        type="submit"
        className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-[#F27C1C] hover:bg-[#ce6918] dark:bg-primary-600 dark:hover:bg-primary-700"
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
        {isEditMode ? 'Update Company' : 'Add Company'}
      </button>
      {message && <p>{message}</p>}
    </form>

      </div>
    </div>
  </div>
</div>





   
   
    
    </>
  )
}

export default AddEdit