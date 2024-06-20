import React from 'react';
import { FaBars, FaLandmark } from 'react-icons/fa';
import { FaBagShopping, FaUserGroup } from 'react-icons/fa6';
import { Link } from 'react-router-dom';

const Sidebar = () => {
  return (
    <>
<aside className="fixed top-0 left-0 z-40 w-64 h-screen pt-10 mt-10 transition-transform -translate-x-full bg-white border-r border-white md:translate-x-0 dark:bg-gray-800 dark:border-gray-700" aria-label="Sidenav" id="drawer-navigation">
    <div className="overflow-y-auto py-5 px-3 h-full bg-white dark:bg-gray-800">
      <form action="#" method="GET" className="md:hidden mb-2">
        <label htmlFor="sidebar-search" className="sr-only">Search</label>
        <div className="relative">
          <div className="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none">
            <svg className="w-5 h-5 text-gray-500 dark:text-gray-400" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fillRule="evenodd" clipRule="evenodd" d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z" />
            </svg>
          </div>
          <input type="text" name="search" id="sidebar-search" className="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" placeholder="Search" />
        </div>
      </form>
      <ul className="space-y-2">

      <li>
          <Link to='/'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaBars  className='w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaBars>
            <span className="ml-3">
             Dashboard       </span>
          </a>
          </Link>
        </li>

        <li>
          <Link to='/job/table'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaBagShopping  className='w-4 h-4 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaBagShopping>
            <span className="ml-3">
            Jobs          </span>
          </a>
          </Link>
        </li>


        <li>
          <Link to='/test'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaUserGroup  className='w-4 h-4 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaUserGroup>
            <span className="ml-3">
             Candidates         </span>
          </a>
          </Link>
        </li>


        <li>
          <Link to='/company/profile'>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg dark:text-white hover:bg-[#fce0c9] dark:hover:bg-gray-700 group">
            <FaLandmark  className='w-5 h-5 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-[#F27C1C] dark:group-hover:text-white'></FaLandmark>
            <span className="ml-3">
             Company          </span>
            
          </a>
          </Link>
        </li>

      

      
        <li>
          <button type="button" className="flex items-center p-2 w-full text-base font-normal text-gray-700 hover:text-[#F27C1C] rounded-lg transition duration-75 group hover:bg-[#fce0c9] dark:text-white dark:hover:bg-gray-700" aria-controls="dropdown-pages" data-collapse-toggle="dropdown-pages">
            <svg aria-hidden="true" className="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 group-hover:text-[#F27C1C] dark:text-gray-400 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fillRule="evenodd" d="M4 4a2 2 0 012-2h4.586A2 2 0 0112 2.586L15.414 6A2 2 0 0116 7.414V16a2 2 0 01-2 2H6a2 2 0 01-2-2V4zm2 6a1 1 0 011-1h6a1 1 0 110 2H7a1 1 0 01-1-1zm1 3a1 1 0 100 2h6a1 1 0 100-2H7z" clipRule="evenodd" />
            </svg>
            <span className="flex-1 ml-3 text-left whitespace-nowrap">Authication</span>
            <svg aria-hidden="true" className="w-6 h-6" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path fillRule="evenodd" d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z" clipRule="evenodd" />
            </svg>
          </button>
          <ul id="dropdown-pages" className="hidden py-2 space-y-2">
            <li>
            <Link to='/login'>
              <a href="#" className="flex items-center p-2 pl-11 w-full text-base font-medium text-gray-500  hover:text-[#F27C1C] hover:bg-[#fce0c9] rounded-lg">
               Login
                </a>
                </Link>
            </li>
            <li>
            <Link to='/register'>
              <a href="#" className="flex items-center p-2 pl-11 w-full text-base font-medium text-gray-500 hover:text-[#F27C1C] hover:bg-[#fce0c9] rounded-lg">
                Register
                </a>
                </Link>
            </li>
            
          </ul>
        </li>
       
      
      </ul>


      <ul className="pt-5 mt-5 space-y-2 border-t border-gray-200 dark:border-gray-700">
        <li>
          <a href="#" className="flex items-center p-2 text-base font-normal text-gray-900 rounded-lg transition duration-75 hover:bg-gray-100 dark:hover:bg-gray-700 dark:text-white group">
            <svg aria-hidden="true" className="flex-shrink-0 w-6 h-6 text-gray-500 transition duration-75 dark:text-gray-400 group-hover:text-gray-900 dark:group-hover:text-white" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
              <path d="M9 2a1 1 0 000 2h2a1 1 0 100-2H9z" />
              <path fillRule="evenodd" d="M4 5a2 2 0 012-2 3 3 0 003 3h2a3 3 0 003-3 2 2 0 012 2v11a2 2 0 01-2 2H6a2 2 0 01-2-2V5zm3 4a1 1 0 000 2h.01a1 1 0 100-2H7zm3 0a1 1 0 000 2h3a1 1 0 100-2h-3zm-3 4a1 1 0 100 2h.01a1 1 0 100-2H7zm3 0a1 1 0 100 2h3a1 1 0 100-2h-3z" clipRule="evenodd" />
            </svg>
            <span className="ml-3">Docs</span>
          </a>
        </li>
    
      </ul>
    </div>
   
  </aside>
    </>
  )
}

export default Sidebar