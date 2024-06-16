import Main from './components/Main';
import { BrowserRouter, Route, Routes } from 'react-router-dom';
import Login from './auth/Login';
import Register from './auth/Register';

import GoogleLoginButton from "./components/GoogleLogin";

export default function App() {
 

  return (
    <>

    
   <BrowserRouter>
   <Routes>
    <Route path='' element={<Main/>}></Route>
    <Route path='/login' element={<Login/>}></Route>
    <Route path='/register' element={<Register/>}></Route>
   </Routes>
   </BrowserRouter>

   
      
      <div>
        <h1>Welcome to My App</h1>
        <GoogleLoginButton />
      </div>
    </>
  );
}
