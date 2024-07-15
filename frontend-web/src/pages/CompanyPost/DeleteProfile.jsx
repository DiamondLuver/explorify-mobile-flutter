import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
import axios from 'axios';

const DeleteProfile = ({ companyId, onClose, onDelete }) => {
  const [showModal, setShowModal] = useState(false);
  const [showSuccessMessage, setShowSuccessMessage] = useState(false);
  const navigate = useNavigate();

  const deleteProgram = () => {
    axios.delete(`http://localhost:8989/api/v1/company/delete/${companyId}/`)
      .then(response => {
        if (response.status === 204) {
          onDelete(companyId); // Assuming this function updates the UI or state after deletion
          setShowSuccessMessage(true);
          setTimeout(() => {
            setShowSuccessMessage(false);
            navigate('/company/profile'); // Redirect to profile page after deletion
          }, 1000); // Delay for 1 second before redirecting
        } else {
          console.error('Failed to delete'); // Handle other statuses if needed
        }
      })
      .catch(error => {
        console.error('Error deleting program: ', error);
        // Optionally, you can show an error message here if needed
      });
  };

  const toggleModal = () => {
    setShowModal(!showModal);
  };

  const handleCancel = () => {
    toggleModal();
    onClose(); // Close modal and perform any necessary cleanup
  };

  const handleConfirmDelete = () => {
    deleteProgram();
    toggleModal(); // Trigger deletion and close modal
  };

  return (
    <>
      <button
        onClick={toggleModal}
        className="block text-white bg-red-600 hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center"
        type="button"
      >
        Delete
      </button>

      {showModal && (
        <div className="fixed top-0 left-0 w-full h-full flex items-center justify-center bg-gray-800 bg-opacity-75 z-50">
          <div className="bg-white p-8 rounded-lg shadow-lg w-full max-w-md h-full md:h-auto">
            <div className="flex justify-between items-center pb-4 mb-4 rounded-t border-b">
              <button
                type="button"
                className="text-gray-400 absolute top-2.5 right-2.5 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm p-1.5 ml-auto inline-flex items-center dark:hover:bg-gray-600 dark:hover:text-white"
                onClick={toggleModal}
              >
                <svg aria-hidden="true" className="w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                  <path fillRule="evenodd" d="M4.293 4.293a1 1 0 011.414 0L10 8.586l4.293-4.293a1 1 0 111.414 1.414L11.414 10l4.293 4.293a1 1 0 01-1.414 1.414L10 11.414l-4.293 4.293a1 1 0 01-1.414-1.414L8.586 10 4.293 5.707a1 1 0 010-1.414z" clipRule="evenodd"></path>
                </svg>
                <span className="sr-only">Close modal</span>
              </button>
            </div>
            <div className="flex justify-center items-center flex-col">
              <svg className="text-gray-400 dark:text-gray-500 w-11 h-11 mb-3.5 mx-auto" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fillRule="evenodd" d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z" clipRule="evenodd"></path>
              </svg>
              <p className="mb-4 text-gray-500 dark:text-gray-300">Are you sure you want to delete this item?</p>
              <div className="flex justify-center items-center space-x-4">
                <button
                  onClick={handleCancel}
                  type="button"
                  className="py-2 px-3 text-sm font-medium text-gray-500 bg-white rounded-lg border border-gray-200 hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-primary-300 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600"
                >
                  No, cancel
                </button>
                <button
                  onClick={handleConfirmDelete}
                  className="py-2 px-3 text-sm font-medium text-center text-white bg-red-600 rounded-lg hover:bg-red-700 focus:ring-4 focus:outline-none focus:ring-red-300 dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-900"
                >
                  Yes, I'm sure
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {showSuccessMessage && (
        <div className="fixed top-16 right-16 bg-green-500 text-white p-3 rounded-lg shadow-lg">
          Delete successful
        </div>
      )}
    </>
  );
};

export default DeleteProfile;
