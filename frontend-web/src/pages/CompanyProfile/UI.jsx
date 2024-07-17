import React from 'react';


import { FaDollarSign, FaGraduationCap, FaCalendarAlt, FaMapMarkerAlt, FaBriefcase } from 'react-icons/fa';

const UI = () => {
  return (
    <>
      <div className="flex min-h-screen items-center justify-center p-10 bg-white mt-10">
        <section id="features" className="container space-y-6 mx-auto md:py-12 lg:pb-12 lg:pt-1">
          <div className="mx-auto grid justify-center gap-4 sm:grid-cols-1 md:max-w-[64rem] md:grid-cols-1">
            <div className="relative overflow-hidden rounded-lg border p-2">
              <div className="flex h-auto flex-col justify-between rounded-md p-6">
                <h2 className="text-3xl font-poppins font-bold text-amber-500 pb-4">kjbjbhk</h2>

                <div className="max-w-4xl mx-auto px-5 ">
                  <div className="grid md:grid-cols-1 gap-10 mt-10">
                    <div className="flex gap-4 items-start"> 
                      <div>
                        <h3 className="font-semibold text-lg">Description</h3>
                        <p className="mt-3 text-gray-700">You don't need to be an expert to customize this plugin. Our code is very readable and well documented.</p>
                      </div>
                    </div>

                    <div className="flex gap-4 items-start">
                     
                      <div>
                        <h3 className="font-semibold text-lg">Requirements</h3>
                        <p className="mt-3 text-gray-700">SalaryjsdkaYou don't need to be an expert to customize this plugin. Our code is very readable and well documented.</p>
                      </div>
                    </div>
                  </div>
                
                  <div className="text-center pt-12">
                    <p className="font-semibold text-2xl">Other Requirments</p>
                   
                  </div>
<div className="grid md:grid-cols-3 sm-grid-cols-3 gap-10 mt-10 px-6">
  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaBriefcase className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">Technology</h3>
      <p className="mt-1 text-gray-500">Job category</p>
    </div>
  </div>

  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaGraduationCap className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">Bachelor's degree</h3>
      <p className="mt-1 text-gray-500">Qualification</p>
    </div>
  </div>

  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaDollarSign className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">100 $ - 200 $</h3>
      <p className="mt-1 text-gray-500">Salary</p>
    </div>
  </div>

  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaBriefcase className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">Full - time</h3>
      <p className="mt-1 text-gray-500">Job type</p>
    </div>
  </div>

  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaCalendarAlt className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">3 months to 6 months </h3>
      <p className="mt-1 text-gray-500">Duration</p>
    </div>
  </div>

  <div className="flex gap-4 items-start">
    <span className="bg-[#fce0c9] text-[#F27C1C] p-3 rounded-full">
      <FaMapMarkerAlt className="w-4 h-4" />
    </span>
    <div>
      <h3 className="font-semibold text-lg">New York </h3>
      <p className="mt-1 text-gray-500">Location</p>
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

export default UI;
