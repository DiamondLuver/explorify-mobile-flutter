
import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { useNavigate } from 'react-router-dom';
import ReactQuill from 'react-quill';
import 'react-quill/dist/quill.snow.css'; // import styles
import { useParams } from 'react-router-dom';
import { Link } from 'react-router-dom';
import Header from './Header';
const EditJob = () => {

  const { jobId } = useParams();
  const navigate = useNavigate();

  const [jobData, setJobData] = useState({
    job_title: '',
    category: '',
    company_name: '',
    location: '',
    job_description: '',
    job_requirement: '',
    salary: '',
    job_type: '',
    job_duration: '',
    qualification: '',
    status: '',
  });

  const [message, setMessage] = useState(null);
  const [loading, setLoading] = useState(false);
  const [showModal, setShowModal] = useState(false); // State to control modal visibility
  
  useEffect(() => {
    const fetchJobData = async () => {
      try {
        const response = await axios.get(`http://localhost:8989/api/v1/post/details/${jobId}/`);
        setJobData(response.data);
      } catch (error) {
        console.error('Error fetching job data:', error);
      }
    };

    fetchJobData();
  }, [jobId]);

  const handleChange = (e) => {
    const { name, value } = e.target;
    setJobData((prevState) => ({ ...prevState, [name]: value }));
  };

  const handleQuillChange = (value) => {
    setJobData((prevState) => ({ ...prevState, job_requirement: value }));
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setLoading(true);
    setMessage(null);
    try {
      const res = await axios.put(`http://localhost:8989/api/v1/post/update/${jobId}/`, jobData, {
        headers: { 'Content-Type': 'application/json' },
      });
      setMessage('Job updated successfully');
      setLoading(false);
      toggleModal(); // Close modal after successful update
      navigate('/company/profile'); // Redirect to profile page after update
    } catch (err) {
      console.error('Error updating job data:', err);
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

    <Header/>
      {/* Edit button/link */}
      <section className="bg-white dark:bg-gray-900 mt-8">
        <div className="py-8 px-4 mx-auto max-w-2xl lg:py-16">
          <h2 className="mb-4 text-xl font-bold text-gray-900 dark:text-white">Edit Job</h2>
          <form onSubmit={handleSubmit}>
            <div className="grid gap-4 mb-4 sm:grid-cols-2">
              <div>
                <label htmlFor="job_title" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Job title
                </label>
                <input
                  type="text"
                  name="job_title"
                  value={jobData.job_title}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="UX / UI designer"
                  required
                />
              </div>
              <div>
                <label htmlFor="category" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Job category
                </label>
                <input
                  type="text"
                  name="category"
                  value={jobData.category}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Web development"
                  required
                />
              </div>
              <div>
                <label htmlFor="company_name" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Company name 
                </label>
                <input
                  type="text"
                  name="company_name"
                  value={jobData.company_name}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Google"
                  required
                />
              </div>
              <div>
                <label htmlFor="qualification" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Qualification
                </label>
                <input
                  type="text"
                  name="qualification"
                  value={jobData.qualification}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Bachelor's degree"
                  required
                />
              </div>
              <div>
                <label htmlFor="job_duration" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Job duration 
                </label>
                <input
                  type="text"
                  name="job_duration"
                  value={jobData.job_duration}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="6 months"
                  required
                />
              </div>
              <div>
                <label htmlFor="job_type" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Job type
                </label>
                <input
                  type="text"
                  name="job_type"
                  value={jobData.job_type}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Full-time"
                  required
                />
              </div>
              <div>
                <label htmlFor="salary" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Salary
                </label>
                <input
                  type="text"
                  name="salary"
                  value={jobData.salary}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="$100 - $200 "
                  required
                />
              </div>
              <div>
                <label htmlFor="status" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Status
                </label>
                <input
                  type="text"
                  name="status"
                  value={jobData.status}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                  placeholder="Open"
                  required
                />
              </div>
            </div>
            <div className="grid gap-4 mb-4 sm:grid-cols-1">
              <div>
                <label htmlFor="location" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                  Address
                </label>
                <input
                  type="text"
                  name="location"
                  value={jobData.location}
                  onChange={handleChange}
                  className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-[#f7ac70] focus:border-[#f7ac70] block w-full p-2.5"
                  placeholder="123 Main St, City"
                  required
                />
              </div>
            </div>
            <div className="sm:col-span-2">
              <label htmlFor="job_description" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Description
              </label>
              <textarea
                id="job_description"
                rows={4}
                name="job_description"
                value={jobData.job_description}
                onChange={handleChange}
                className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Write description here"
              ></textarea>
            </div>
            <div className="sm:col-span-2 pt-5">
              <label htmlFor="job_requirement" className="block mb-2 text-sm font-medium text-gray-900 dark:text-white">
                Requirement
              </label>
              <ReactQuill
                id="job_requirement"
                value={jobData.job_requirement}
                onChange={handleQuillChange}
                modules={{
                  toolbar: [
                    [{ 'header': '1' }, { 'header': '2' }, { 'font': [] }],
                    [{ size: [] }],
                    ['bold', 'italic', 'underline', 'strike', 'blockquote'],
                    [{ 'list': 'ordered' }, { 'list': 'bullet' },
                    { 'indent': '-1' }, { 'indent': '+1' }],
                    ['clean']
                  ],
                }}
                formats={[
                  'header', 'font', 'size',
                  'bold', 'italic', 'underline', 'strike', 'blockquote',
                  'list', 'bullet', 'indent'
                ]}
                className="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-primary-500 focus:border-primary-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                placeholder="Write requirements here"
              />
            </div>
            {message && (
              <div className="mt-4">
                <p className={`text-sm ${message.includes('successfully') ? 'text-green-500' : 'text-red-500'}`}>
                  {message}
                </p>
              </div>
            )}
              <div class="flex items-center space-x-4 pt-5">
                <button
                    type="submit"
                    className="text-white bg-[#F27C1C] hover:bg-[#ce6918] focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800"
                    disabled={loading}
                  >
                    {loading ? 'Submitting...' : 'Update'}
                  </button>

                  <Link to="/job/table">

                  <button type="button" class="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">
                  Cancel
              </button>

              </Link>  
          </div>

          </form>
        </div>
      </section>
    </>
  );
};

export default EditJob;