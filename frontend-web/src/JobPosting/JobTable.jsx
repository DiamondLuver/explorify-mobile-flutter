import axios from 'axios';
import React, { useEffect, useState } from 'react';
import { FaEye, FaPenAlt } from 'react-icons/fa';
import Pagiantion from '../CompanyPost/Pagiantion';
import Header from './Header';
import JobBar from './JobBar';
import { Link } from 'react-router-dom';
import DeleteJob from './DeleteJob';
const JobTable = () => {
    const [jobs, setJobs] = useState([]);

    useEffect(() => {
        axios.get('http://localhost:8989/api/v1/post/list/')
            .then(response => setJobs(response.data))
            .catch(error => console.error('Error fetching data', error));
    }, []);

    return (
        <>
        <Header/>
            <section className="py-10 sm:py-5">
                <div className="mx-auto max-w-screen-2xl lg:px-1">
                    <div className="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
                    <JobBar/>
                        <div className="overflow-x-auto">
                            <table className="w-full text-sm text-left text-gray-500 dark:text-gray-400">
                                <thead className="text-xs text-[#F27C1C] uppercase bg-[#fef2e8] dark:bg-gray-700 dark:text-gray-400">
                                    <tr>
                                        <th scope="col" className="p-4">
                                            <div className="flex items-center">
                                                <input id="checkbox-all" type="checkbox" className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                                                <label htmlFor="checkbox-all" className="sr-only">checkbox</label>
                                            </div>
                                        </th>
                                        <th scope="col" className="px-4 py-3">Position</th>
                                        <th scope="col" className="px-4 py-3">Specialization</th>
                                        <th scope="col" className="px-4 py-3">Salary</th>
                                        <th scope="col" className="px-4 py-3">Duration</th>
                                        <th scope="col" className="px-4 py-3">Job Type</th>
                                        <th scope="col" className="px-4 py-3">Status</th>
                                        <th scope="col" className="px-4 py-3">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    {jobs.map(job => (
                                        <tr key={job.internship_post_id} className="border-b dark:border-gray-600 hover:bg-[#fef2e8] dark:hover:bg-gray-700">
                                            <td className="w-4 px-4 py-3">
                                                <div className="flex items-center">
                                                    <input id={`checkbox-${job.internship_post_id}`} type="checkbox" className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                                                    <label htmlFor={`checkbox-${job.internship_post_id}`} className="sr-only">checkbox</label>
                                                </div>
                                            </td>
                                            <td scope="row" className="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                                {job.job_title}
                                            </td>
                                            <td className="px-4 py-2">
                                                <span className="bg-amber-100 text-amber-400 text-xs font-medium px-2 py-0.5 rounded-full dark:bg-primary-900 dark:text-primary-300">{job.category}</span>
                                            </td>
                                            <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">{job.salary}</td>
                                            <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">{job.job_duration}</td>
                                            <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">{job.job_type}</td>
                                            <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">{job.status}</td>
                                            <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                                                <div className="flex items-center">
                                                 <Link to={`/details/job/${job.internship_post_id}`}> 
                                                        <FaEye className="mr-3 text-amber-600" />
                                                 </Link> 
                                                 <Link to={`/edit/job/${job.internship_post_id}`}> 
                                                        <FaPenAlt className="mr-3 text-blue-600" />
                                                 </Link> 
                                                
                                                 <DeleteJob jobId={job.internship_post_id} />
                                                   
                                                </div>
                                            </td>
                                        </tr>
                                    ))}
                                </tbody>
                            </table>
                        </div>
                       <Pagiantion/>
                    </div>
                </div>
            </section>
        </>
    );
};

export default JobTable;
