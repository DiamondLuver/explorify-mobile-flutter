import React from 'react'
import AreaChartHero from './AreaChartHero'
import Navbar from './Navbar'
import { Link } from 'react-router-dom';

const Dashboard = () => {
  return (
    <>
  <div className='mt-8'>
  
{/* Code block starts */}
<div className="mt-6 lg:my-6 container px-4 mx-auto flex flex-col md:flex-row items-start md:items-center justify-between pb-4  ">
  <div>
    {/*- more free and premium Tailwind CSS components at https://tailwinduikit.com/ -*/}
    <h4 className="text-2xl font-bold leading-tight text-gray-800 dark:text-gray-100">Welcome back , JKKK ! </h4>
  </div>
  <div className=" md:mt-0">
    <Link to ='/job/create'>
  <button type="button"
                class="flex items-center justify-center px-4 py-2 text-sm font-medium text-white rounded-lg bg-amber-600 hover:bg-amber-500 focus:ring-4 focus:ring-amber-300 ">
          <svg xmlns="http://www.w3.org/2000/svg" class="h-3.5 w-3.5 mr-2 -ml-1" viewBox="0 0 20 20" fill="currentColor"
               aria-hidden="true">
            <path
              d="M8 9a3 3 0 100-6 3 3 0 000 6zM8 11a6 6 0 016 6H2a6 6 0 016-6zM16 7a1 1 0 10-2 0v1h-1a1 1 0 100 2h1v1a1 1 0 102 0v-1h1a1 1 0 100-2h-1V7z"/>
          </svg>
          Create new job
        </button>
        </Link>
  </div>
</div>
{/* Code block ends */}
 

<div className='px-4'>
<h4 className="text-md font-bold leading-tight text-gray-800 dark:text-gray-100 pb-6">Total applications</h4>
    <Navbar/>

   
    <AreaChartHero/>
    </div>

</div>


    </>
  )
}

export default Dashboard