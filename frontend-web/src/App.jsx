import React from "react";
import { BrowserRouter, Route } from "react-router-dom";
import { LoadingProvider } from "./context/LoadingContext";
import { AuthProvider } from "src/context/AuthContext";
import { setupAxiosInterceptors } from "src/utils/axiosInstance";
import Routes from "src/routes/Routes";
import Spinner from "./components/SmallComponents/Spinner";
import { useLoading } from "./context/LoadingContext";

const Custom = () => {
  const { isLoading } = useLoading();

  return (
    <>
      {isLoading && <Spinner />}
      <Routes />
    </>
  );
};

export default function App() {
  React.useEffect(() => {
    setupAxiosInterceptors();
  }, []);
  return (
    <BrowserRouter>
      <LoadingProvider>
        <AuthProvider>
          <Custom />
        </AuthProvider>
      </LoadingProvider>
    </BrowserRouter>
  );
  // return (
  //   <BrowserRouter>
  //     <LoadingProvider>
  //       <AuthProvider>
  //         <Routes>
  //           <Route
  //             path="/"
  //             element={
  //               <Main>
  //                 <Dashboard />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/UI"
  //             element={
  //               <Main>
  //                 <UI />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/job/table"
  //             element={
  //               <Main>
  //                 <JobTable />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/job/create"
  //             element={
  //               <Main>
  //                 <AddJob />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/details/job/:jobId"
  //             element={
  //               <Main>
  //                 <JobDetail />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/edit/job/:jobId"
  //             element={
  //               <Main>
  //                 <EditJob />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/delete/job/:jobId"
  //             element={
  //               <Main>
  //                 <DeleteJob />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/test"
  //             element={
  //               <Main>
  //                 <Test />
  //               </Main>
  //             }
  //           />

  //           <Route path="/login" element={<Login />} />
  //           <Route path="/register" element={<Register />} />

  //           {/* Protected Routes */}
  //           <Route
  //             path="/company/profile"
  //             element={
  //               <Main>
  //                 <CompanyTable />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/details/company/:companyId"
  //             element={
  //               <Main>
  //                 <ViewDetail />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/edit/company/:companyId"
  //             element={
  //               <Main>
  //                 <Edit />
  //               </Main>
  //             }
  //           />
  //           <Route
  //             path="/delete/company/:companyId"
  //             element={
  //               <Main>
  //                 <DeleteProfile />
  //               </Main>
  //             }
  //           />
  //         </Routes>
  //       </AuthProvider>
  //     </LoadingProvider>
  //   </BrowserRouter>
  // );
}
