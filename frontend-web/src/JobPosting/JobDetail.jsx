
import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import Header from './Header';
import { FaBuilding, FaIndustry, FaLink, FaMapMarkedAlt, FaTasks } from 'react-icons/fa';
import DOMPurify from 'dompurify';
const JobDetail = () => {
    const { jobId } = useParams();
    const [jobData, setJobData] = useState(null);
    const [error, setError] = useState(null);
    const sanitizedHTML = DOMPurify.sanitize(jobData ? jobData.job_requirement : '');

    useEffect(() => {
        const fetchJobData = async () => {
            try {
                const response = await axios.get(`http://localhost:8989/api/v1/post/details/${jobId}/`);
                setJobData(response.data);
            } catch (error) {
                setError(error.message);
            }
        };

        fetchJobData();
    }, [jobId]);

    if (error) {
        return <p>Error: {error}</p>;
    }

    if (!jobData) {
        return <p>Loading...</p>;
    }

 

    return (
        <>
            <Header />
            <div className="flex min-h-screen items-center justify-center p-10 bg-white mt-10">
                <section id="features" className="container space-y-6 mx-auto md:py-12 lg:pb-12 lg:pt-1">
                    <div className="mx-auto grid justify-center gap-4 sm:grid-cols-1 md:max-w-[64rem] md:grid-cols-1">
                        <div className="relative overflow-hidden rounded-lg border p-2">
                            <div className="flex h-auto flex-col justify-between rounded-md p-6">
                                <h2 className="text-3xl font-poppins font-bold text-amber-500 pb-4">{jobData.job_title}</h2>
                                <div className="space-y-2 pt-5">
                                    <h3 className="font-bold">Description</h3>
                                    <p className="text-sm text-muted-foreground">
                                    {jobData.job_description}
                                    </p>

                                    <h3 className="font-bold pt-5">Requirements</h3>
                                    <div className="font-normal text-sm" dangerouslySetInnerHTML={{ __html: sanitizedHTML }} />
                                </div>


<div className="mx-auto grid justify-center gap-4 md:max-w-[64rem] md:grid-cols-1 mt-6 pt-8">
  <div className="relative overflow-hidden rounded-lg bg-amber-50 p-2">
    <div className="grid grid-cols-1 sm:grid-cols-2 gap-4 p-6">
      <div className="flex items-center">
        <FaTasks size={20} className="text-amber-500" />
        <h3 className="pl-3 font-semibold text-gray-800">
          Job Category : <span className="font-normal">{jobData.category}</span>
        </h3>
      </div>

      <div className="flex items-center">
        <FaTasks size={20} className="text-amber-500" />
        <h3 className="pl-3  font-semibold text-gray-800">
         Qulification : <span className="font-normal"> {jobData.qualification}</span>
        </h3>
      </div>

      <div className="flex items-center">
        <FaTasks size={18} className="text-amber-500" />
        <h3 className="pl-3 font-semibold text-gray-800">
          Salary : <span className="font-normal">{jobData.salary}</span>
        </h3>
      </div>

      <div className="flex items-center">
        <FaTasks size={20} className="text-amber-500" />
        <h3 className="pl-3 font-semibold text-gray-800">
          Job type : <span className="font-normal">{jobData.job_type}</span>
        </h3>
      </div>

      <div className="flex items-center">
        <FaTasks size={20} className="text-amber-500" />
        <h3 className="pl-3 font-semibold text-gray-800">
          Duration : <span className="font-normal">{jobData.job_duration}</span>
        </h3>
      </div>

      <div className="flex items-center">
        <FaTasks size={20} className="text-amber-500" />
        <h3 className="pl-3 font-semibold text-gray-800">
          Location : <span className="font-normal">{jobData.location}</span>
        </h3>
      </div>
    </div>
  </div>
</div>

                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </>
    );
};

export default JobDetail;