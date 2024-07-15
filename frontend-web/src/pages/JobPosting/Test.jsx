import React, { useEffect, useState } from 'react';
import axios from 'axios';
import { useParams } from 'react-router-dom';
import Header from './Header';
import { FaBuilding, FaIndustry, FaLink, FaMapMarkedAlt, FaTasks } from 'react-icons/fa';

const Test = () => {
    const { companyId } = useParams();
    const [companyData, setCompanyData] = useState(null);
    const [error, setError] = useState(null);

    useEffect(() => {
        const fetchCompanyData = async () => {
            try {
                const response = await axios.get(`http://localhost:8989/api/v1/company/details/${companyId}/`);
                setCompanyData(response.data);
            } catch (error) {
                setError(error.message);
            }
        };

        fetchCompanyData();
    }, [companyId]);

    if (error) {
        return <div className="text-red-500 text-center mt-4">Error: {error}</div>;
    }

    if (!companyData) {
        return <div className="text-center mt-4">Loading...</div>;
    }

    const renderCompanyDetail = (icon, label, value, isLink = false) => (
        <div className="flex items-center my-2">
            {icon}
            <p className="text-lg dark:text-neutral-200">
                <span className="font-semibold text-gray-700">{label}</span>
                {isLink ? (
                    <a href={value} className="text-blue-500 hover:underline" target="_blank" rel="noopener noreferrer">
                        {value}
                    </a>
                ) : (
                    `: ${value}`
                )}
            </p>
        </div>
    );

    return (
        <div className="antialiased dark:bg-gray-900">
            <Header />
            <article className="font-fira mx-auto max-w-3xl p-4 selection:bg-black selection:text-white">



                <img
                    className="float-right w-44 rounded-full pt-5"
                    src="https://st1.bollywoodlife.com/wp-content/uploads/2024/05/1-50.png?impolicy=Medium_Widthonly&w=400&h=711"
                    alt="Company Logo"
                />
                <div className="py-3 ">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">Company Profile</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <div className="space-y-4 pt-3">
                        {renderCompanyDetail(<FaBuilding className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Company Icon" />, 'Company Name', companyData.company_name)}
                        {renderCompanyDetail(<FaMapMarkedAlt className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Head Office Icon" />, 'Head Office', companyData.head_office)}
                        {renderCompanyDetail(<FaIndustry className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Industry Icon" />, 'Industry', companyData.company_type)}
                        {renderCompanyDetail(<FaTasks className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Specialization Icon" />, 'Specialization', companyData.specialization)}
                        {renderCompanyDetail(<FaLink className="mr-4 h-5 w-5 text-[#F27C1C]" aria-label="Website Icon" />, 'Website :', companyData.company_website, true)}
                    </div>
                </div>

                <section className="mt-12">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">About Company</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <p className="mt-6 text-lg dark:text-neutral-200">{companyData.description}</p>
                </section>

                <section className="mt-12">
                    <h2 className="text-lg font-poppins font-bold text-amber-500">Location</h2>
                    <div className="border-2 bg-amber-500 w-36 my-3" />
                    <p className="mt-6 text-lg dark:text-neutral-200">Location : {companyData.location}</p>
                    <iframe
                        src={`https://www.google.com/maps/embed?pb=${companyData.location}`}
                        className="rounded-lg w-full h-64 pt-5"
                        style={{ border: 0 }}
                        allowFullScreen
                        loading="lazy"
                        referrerPolicy="no-referrer-when-downgrade"
                        title="Company Location"
                    />
                </section>

                <div class="flex items-center space-x-4 pt-10">
                    <button type="button" class="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">
                        Go back
                    </button>
                    <button type="submit" class="text-white bg-amber-600 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                        Edit profile
                    </button>
                </div>
            </article>
        </div>
    );
};

export default Test;
