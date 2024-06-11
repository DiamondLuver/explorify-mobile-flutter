import React from 'react'
import Navbar from '../layout/Navbar'
import Sidebar from '../layout/Sidebar'

const Main = ({ children }) => {
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
      
          { children }
        

        </main>

      </div>
   
    </>
  )
}

export default Main