import React from 'react';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import CompanyTable from './CompanyPost/CompanyTable';
import Login from './auth/Login';
import Register from './auth/Register';
import Main from './components/Main';
import ViewDetail from './CompanyPost/ViewDetail';
import Dashboard from './Page/Dashboard';
import JobTable from './JobPosting/JobTable';
import JobDetail from './JobPosting/JobDetail';



export default function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route 
          path="/" 
          element={
            <Main>
             <Dashboard/>
            </Main>
          }
        />

         <Route 
          path="/job/posting" 
          element={
            <Main>
             <JobTable/>
            </Main>
          }
        />

        <Route 
          path="/details/job/:jobId" 
          element={
            <Main>
              <JobDetail />
            </Main>
          }
        />


       
       
    
        <Route path="/login" element={<Login />} />
        <Route path="/register" element={<Register />} />
  
  {/* Company post route */}
        <Route 
          path="/company/profile" 
          element={
            <Main>
              <CompanyTable />
            </Main>
          } 
        />

        <Route 
          path="/details/company/:companyId" 
          element={
            <Main>
              <ViewDetail />
            </Main>
          }
        />

        <Route 
          path="/edits/company/:companyId" 
          element={
            <Main>
              <CompanyTable />
            </Main>
          }
        />

       
        
      </Routes>
    </BrowserRouter>
  );
}
