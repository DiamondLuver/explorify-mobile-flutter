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
import Test from './components/Test';

import Edit from './CompanyPost/Edit';
import DeleteProfile from './CompanyPost/DeleteProfile';
import DeleteJob from './JobPosting/DeleteJob';
import EditJob from './JobPosting/EditJob';
import AddJob from './JobPosting/AddJob';
import UI from './companyProfile/UI';




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
          path="/UI" 
          element={
            <Main>
             <UI/>
            </Main>
          }
        />

        {/*  For job posting URL  */}
        
         <Route 
          path="/job/table" 
          element={
            <Main>
             <JobTable/>
            </Main>
          }
        />


         <Route 
          path="/job/create" 
          element={
            <Main>
             <AddJob/>
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


        <Route 
          path="/edit/job/:jobId" 
          element={
            <Main>
              <EditJob />
            </Main>
          }
        />


         <Route 
          path="/delete/job/:jobId" 
          element={
            <Main>
              <DeleteJob />
            </Main>
          }
        />


         <Route 
          path="/test" 
          element={
            <Main>
              <Test />
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
          path="/edit/company/:companyId" 
          element={
            <Main>
              <Edit/>
            </Main>
          }
        />      


         <Route 
          path="/delete/company/:companyId" 
          element={
            <Main>
              <DeleteProfile/>
            </Main>
          }
        />      




    

      </Routes>
    </BrowserRouter>
  );
}
