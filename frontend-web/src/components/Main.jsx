import React from 'react'
import Navbar from '../layout/Navbar'
import Sidebar from '../layout/Sidebar'
import Table from './Table'
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import CForm from './CForm';
const Main = () => {
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
      
         <Routes>

          <Route path='' element={<Table/>}> </Route>
          <Route path='/form' element={<CForm/>}></Route>

         </Routes>
        

        </main>

      </div>
   
    </>
  )
}

export default Main