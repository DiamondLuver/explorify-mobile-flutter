import React from 'react';
import { FaTrash } from 'react-icons/fa';
import { FaPenToSquare } from 'react-icons/fa6';
import { FiChevronRight } from 'react-icons/fi';
import { HiHome } from 'react-icons/hi';

const Table = () => {
  return (
    <>

<div className='pt-6'>
      <nav aria-label="Breadcrumb" className="mb-4">
        <ol className="flex items-center">

          <li className="group flex items-center">
            <FiChevronRight
              className="mx-1 h-6 w-6 text-[#F27C1C] group-first:hidden md:mx-2"
              data-testid="flowbite-breadcrumb-separator"
            />
            <a
              className="flex items-center text-sm font-medium text-[#F27C1C] dark:text-gray-400 dark:hover:text-white"
              data-testid="flowbite-breadcrumb-item"
              href="#"
            >
              <div className="flex items-center gap-x-3">
                <HiHome
                  className="text-xl"
                />
                <span className="dark:text-white">Home</span>
              </div>
            </a>
          </li>

          <li className="group flex items-center">
            <FiChevronRight
              className="mx-1 h-6 w-6 text-gray-400 group-first:hidden md:mx-2"
              data-testid="flowbite-breadcrumb-separator"
            />
            <a
              className="flex items-center text-sm font-medium text-gray-700 hover:text-gray-900 dark:text-gray-400 dark:hover:text-white"
              data-testid="flowbite-breadcrumb-item"
              href="/users/list"
            >
              Users
            </a>
          </li>

          <li className="group flex items-center">
            <FiChevronRight
              className="mx-1 h-6 w-6 text-gray-400 group-first:hidden md:mx-2"
              data-testid="flowbite-breadcrumb-separator"
            />
            <span
              className="flex items-center text-sm font-medium text-gray-500 dark:text-gray-400"
              data-testid="flowbite-breadcrumb-item"
            >
              Profile
            </span>
          </li>

        </ol>
      </nav>
      <h1 className="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl">Table</h1>
</div>



<section className=" py-10 sm:py-5">
  <div className="mx-auto max-w-screen-2xl lg:px-1">
    <div className="relative overflow-hidden bg-white shadow-md dark:bg-gray-800 sm:rounded-lg">
    <div className="flex flex-col items-center justify-between p-4 space-y-3 md:flex-row md:space-y-0 md:space-x-4">
  <div className="w-full md:w-1/2">

    <form className="flex items-center">
      <label htmlFor="simple-search" className="sr-only">Search</label>
      <div className="relative w-full">
        <div className="absolute inset-y-0 left-0 flex items-center pl-3 pointer-events-none">
          <svg aria-hidden="true" className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
            <path fillRule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" clipRule="evenodd" />
          </svg>
        </div>
        <input type="text" id="simple-search" className="block w-full p-2 pl-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-[#f7ac70] focus:border-[#f7ac70] dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Search" required />
      </div>
    </form>

  </div>

  
  <div className="flex flex-col items-stretch justify-end flex-shrink-0 w-full space-y-2 md:w-auto md:flex-row md:space-y-0 md:items-center md:space-x-3">

    <button type="button" className="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-[#F27C1C] hover:bg-[#ce6918]  dark:bg-primary-600 dark:hover:bg-primary-700 ">
      <svg className="h-3.5 w-3.5 mr-2" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
        <path clipRule="evenodd" fillRule="evenodd" d="M10 3a1 1 0 011 1v5h5a1 1 0 110 2h-5v5a1 1 0 11-2 0v-5H4a1 1 0 110-2h5V4a1 1 0 011-1z" />
      </svg>
      Add new
    </button>

    <div className="flex items-center w-full space-x-3 md:w-auto">
      <button id="actionsDropdownButton" data-dropdown-toggle="actionsDropdown" className="flex items-center justify-center w-full px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg md:w-auto focus:outline-none hover:bg-gray-100  focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700" type="button">
        <svg className="-ml-1 mr-1.5 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path clipRule="evenodd" fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
        </svg>
        Actions
      </button>
      <div id="actionsDropdown" className="z-10 hidden bg-white divide-y divide-gray-100 rounded shadow w-44 dark:bg-gray-700 dark:divide-gray-600">
        <ul className="py-1 text-sm text-gray-700 dark:text-gray-200" aria-labelledby="actionsDropdownButton">
          <li>
            <a href="#" className="block px-4 py-2 hover:bg-gray-100 dark:hover:bg-gray-600 dark:hover:text-white">Mass Edit</a>
          </li>
        </ul>
        <div className="py-1">
          <a href="#" className="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100 dark:hover:bg-gray-600 dark:text-gray-200 dark:hover:text-white">Delete all</a>
        </div>
      </div>
      <button id="filterDropdownButton" data-dropdown-toggle="filterDropdown" className="flex items-center justify-center w-full px-4 py-2 text-sm font-medium text-gray-900 bg-white border border-gray-200 rounded-lg md:w-auto focus:outline-none hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700" type="button">
        <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" className="w-4 h-4 mr-2 text-gray-400" viewBox="0 0 20 20" fill="currentColor">
          <path fillRule="evenodd" d="M3 3a1 1 0 011-1h12a1 1 0 011 1v3a1 1 0 01-.293.707L12 11.414V15a1 1 0 01-.293.707l-2 2A1 1 0 018 17v-5.586L3.293 6.707A1 1 0 013 6V3z" clipRule="evenodd" />
        </svg>
        Filter
        <svg className="-mr-1 ml-1.5 w-5 h-5" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
          <path clipRule="evenodd" fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" />
        </svg>
      </button>
      {/* Dropdown menu */}
      <div id="filterDropdown" className="z-10 hidden w-48 p-3 bg-white rounded-lg shadow dark:bg-gray-700">
        <h6 className="mb-3 text-sm font-medium text-gray-900 dark:text-white">
          Category
        </h6>
        <ul className="space-y-2 text-sm" aria-labelledby="dropdownDefault">
          <li className="flex items-center">
            <input id="apple" type="checkbox" defaultValue className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500" />
            <label htmlFor="apple" className="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">
              Apple (56)
            </label>
          </li>
          <li className="flex items-center">
            <input id="fitbit" type="checkbox" defaultValue className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500" />
            <label htmlFor="fitbit" className="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">
              Fitbit (56)
            </label>
          </li>
          <li className="flex items-center">
            <input id="dell" type="checkbox" defaultValue className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500" />
            <label htmlFor="dell" className="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">
              Dell (56)
            </label>
          </li>
          <li className="flex items-center">
            <input id="asus" type="checkbox" defaultValue defaultChecked className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-700 focus:ring-2 dark:bg-gray-600 dark:border-gray-500" />
            <label htmlFor="asus" className="ml-2 text-sm font-medium text-gray-900 dark:text-gray-100">
              Asus (97)
            </label>
          </li>
        </ul>
      </div>
    </div>
  </div>



</div>

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
              <th scope="col" className="px-4 py-3">Job Type</th>
              <th scope="col" className="px-4 py-3">Salary</th>
              <th scope="col" className="px-4 py-3">Duration</th>
              <th scope="col" className="px-4 py-3">Application</th>
              <th scope="col" className="px-4 py-3">Action</th>
            </tr>
          </thead>
          <tbody>
            
            <tr className="border-b dark:border-gray-600 hover:bg-[#fef2e8] dark:hover:bg-gray-700">
              <td className="w-4 px-4 py-3">
                <div className="flex items-center">
                  <input id="checkbox-table-search-1" type="checkbox" onclick="event.stopPropagation()" className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                  <label htmlFor="checkbox-table-search-1" className="sr-only">checkbox</label>
                </div>
              </td>


              <th scope="row" className="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                Blockchain developer
              </th>
              <td className="px-4 py-2">
                <span className="bg-amber-100 text-amber-400 text-xs font-medium px-2 py-0.5 rounded-full dark:bg-primary-900 dark:text-primary-300">Software Enginnering</span>
              </td>
              
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">Full Time</td>
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">100$</td>
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">3 Months</td>
              <td className="px-4 py-2 font-medium text-red-600 whitespace-nowrap dark:text-white"> Closed </td>

              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
              <div className="flex items-center">
      <FaPenToSquare style={{ color: 'blue' }} className="mr-2" />
      <FaTrash style={{ color: 'red' }} />
    </div>
              </td>
            
            </tr>


            <tr className="border-b dark:border-gray-600 hover:bg-[#fef2e8] dark:hover:bg-gray-700">
              <td className="w-4 px-4 py-3">
                <div className="flex items-center">
                  <input id="checkbox-table-search-1" type="checkbox" onclick="event.stopPropagation()" className="w-4 h-4 bg-gray-100 border-gray-300 rounded text-primary-600 focus:ring-primary-500 dark:focus:ring-primary-600 dark:ring-offset-gray-800 focus:ring-2 dark:bg-gray-700 dark:border-gray-600" />
                  <label htmlFor="checkbox-table-search-1" className="sr-only">checkbox</label>
                </div>
              </td>


              <th scope="row" className="flex items-center px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
                Web Developer
              </th>
              <td className="px-4 py-2">
                <span className="bg-amber-100 text-amber-400 text-xs font-medium px-2 py-0.5 rounded-full dark:bg-primary-900 dark:text-primary-300">Software Enginnering</span>
              </td>
              
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">Full Time</td>
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">100$</td>
              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">3 Months</td>
              <td className="px-4 py-2 font-medium text-red-600 whitespace-nowrap dark:text-white"> Closed </td>

              <td className="px-4 py-2 font-medium text-gray-900 whitespace-nowrap dark:text-white">
              <div className="flex items-center">
                <FaPenToSquare style={{ color: 'blue' }} className="mr-2" />
                <FaTrash style={{ color: 'red' }} />
              </div>
              </td>
            
            </tr>
           
           
          </tbody>
        </table>
      </div>
      <nav className="flex flex-col items-start justify-between p-4 space-y-3 md:flex-row md:items-center md:space-y-0" aria-label="Table navigation">
        <span className="text-sm font-normal text-gray-500 dark:text-gray-400">
          Showing
          <span className="font-semibold text-gray-900 dark:text-white">1-10</span>
          of
          <span className="font-semibold text-gray-900 dark:text-white">1000</span>
        </span>
        <ul className="inline-flex items-stretch -space-x-px">
          <li>
            <a href="#" className="flex items-center justify-center h-full py-1.5 px-3 ml-0 text-gray-500 bg-white rounded-l-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
              <span className="sr-only">Previous</span>
              <svg className="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fillRule="evenodd" d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z" clipRule="evenodd" />
              </svg>
            </a>
          </li>
          <li>
            <a href="#" className="flex items-center justify-center px-3 py-2 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">1</a>
          </li>
          <li>
            <a href="#" className="flex items-center justify-center px-3 py-2 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">2</a>
          </li>
          <li>
            <a href="#" aria-current="page" className="z-10 flex items-center justify-center px-3 py-2 text-sm leading-tight border text-primary-600 bg-primary-50 border-primary-300 hover:bg-primary-100 hover:text-primary-700 dark:border-gray-700 dark:bg-gray-700 dark:text-white">3</a>
          </li>
          <li>
            <a href="#" className="flex items-center justify-center px-3 py-2 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">...</a>
          </li>
          <li>
            <a href="#" className="flex items-center justify-center px-3 py-2 text-sm leading-tight text-gray-500 bg-white border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">100</a>
          </li>
          <li>
            <a href="#" className="flex items-center justify-center h-full py-1.5 px-3 leading-tight text-gray-500 bg-white rounded-r-lg border border-gray-300 hover:bg-gray-100 hover:text-gray-700 dark:bg-gray-800 dark:border-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white">
              <span className="sr-only">Next</span>
              <svg className="w-5 h-5" aria-hidden="true" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                <path fillRule="evenodd" d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z" clipRule="evenodd" />
              </svg>
            </a>
          </li>
        </ul>
      </nav>
    </div>
  </div>
</section>


   
    </>
  )
}

export default Table