import React from 'react'
import Add from './Add'
import Navbar from '../layout/Navbar'
import Sidebar from '../layout/Sidebar'

const AddProfile = () => {
  return (

    <>
         <div className="antialiased dark:bg-gray-900">
        {/* Start Navbar */}
        <Navbar />
        {/* End Navbar */}
        
        {/* Sidebar */}
        <Sidebar />
        {/* End Sidebar */}

        <main className="p-4 md:ml-64 h-auto pt-20">
          {/* Call Content */}
      
        <Add/>
        

        </main>

      </div>
   
    </>
    
  )
}

export default AddProfile