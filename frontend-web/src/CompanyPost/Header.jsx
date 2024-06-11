import React from 'react'
import { FiChevronRight } from 'react-icons/fi';
import { HiHome } from 'react-icons/hi';

const Header = () => {
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
      <h1 className="text-xl font-semibold text-gray-900 dark:text-white sm:text-2xl">Company Background</h1>
</div>

    </>
  )
}

export default Header